import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:staff_maintenance_app/backend/services/maintenance_service.dart';
import 'package:staff_maintenance_app/backend/services/vehicle_service.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:staff_maintenance_app/models/maintenance/sparepart_detail.dart';
import 'package:staff_maintenance_app/models/maintenance/sparepart_item.dart';
import 'package:staff_maintenance_app/models/maintenance/status.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/service/maintenance_service_screen.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/sparepart_check/sparepart_check_screen.dart';

@injectable
class SparepartCheckScreenModel extends BaseViewModel<SparepartCheckScreen> {
  int maintenanceId;

  final _maintenance = Rx<Maintenance>(null);
  final _sparePartItems = RxList<SparePartItem>(null);
  final _statuses = RxList<Status>(null);
  final _checkListItems = RxList<SparePartDetail>(null);

  Maintenance get maintenance => _maintenance.value;

  List<Status> get statuses => _statuses.value;

  List<SparePartDetail> get checkListItems => _checkListItems.value;

  final MaintenanceService maintenanceService;
  final VehicleService vehicleService;

  SparepartCheckScreenModel(this.maintenanceService, this.vehicleService);

  final level = RxDouble(0.0);
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  final lastWords = RxString();
  final lastError = RxString();
  final lastStatus = RxString();
  final _currentLocaleId = RxString();
  final resultListened = RxInt(0);
  final speech = Rx<SpeechToText>(SpeechToText());

  FlutterTts flutterTts;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;

  final _currentPositionElement = Rx<SparePartDetail>();

  SparePartDetail get currentPositionElement => _currentPositionElement.value;

  @override
  void onInit() {
    loadData();
    initSpeechState();
    super.onInit();
  }

  void loadData() {
    call(() async {
      await _loadMaintenance();
      await _loadSparepartCheckList();
      await _loadStatuses();
      generateCheckListItems();
    }, toastOnError: true, background: false);
  }

  Future _loadMaintenance() async {
    _maintenance.value = (await maintenanceService.getMaintenance(maintenanceId: maintenanceId)).data;
  }

  Future _loadSparepartCheckList() async {
    _sparePartItems.value = (await vehicleService.getVehicleSpareParts(maintenance.userVehicle.vehicleGroupId)).data;
  }

  Future _loadStatuses() async {
    _statuses.value = (await vehicleService.getStatuses()).data;
    statuses.forEach((element) {
      print(element.name);
    });
  }

  void generateCheckListItems() {
    if (maintenance == null || statuses == null || _sparePartItems.value == null) return;
    var result = List<SparePartDetail>.from(maintenance.sparePartCheckDetail);
    _sparePartItems.value.forEach((checkItem) {
      if (!result.any((element) => element.sparePartItemId == checkItem.id)) {
        result.add(SparePartDetail(maintenanceId: maintenanceId, sparePartItem: checkItem, sparePartItemId: checkItem.id));
      }
    });
    _checkListItems.value = result;
  }

  void onValueChange(SparePartDetail item, Status newStatus) {
    item.status = newStatus;
    item.statusId = newStatus.id;
    _checkListItems.refresh();
  }

  void onConfirm() {
    var checkList = List<Map<String, dynamic>>();
    checkListItems.forEach((element) {
      if (element.status == null) return;
      checkList.add(<String, dynamic>{"StatusId": element.statusId, "VehicleSparePartId": element.sparePartItem.id});
    });
    var params = <String, dynamic>{
      "SparePartMaintenanceChecks": checkList,
    };
    print(params);

    call(() async {
      final result = await maintenanceService.updateCheckList(maintenanceId: maintenanceId, params: params);
      MaintenanceServiceScreen.start(maintenanceId: maintenanceId);
    }, background: false, toastOnError: true);
  }

  Future setUpTTS() async {
    flutterTts = FlutterTts();
    final languages = await flutterTts.getLanguages;
    flutterTts.setLanguage("vi-VN");
    if (Platform.isAndroid) {
      var engines = await flutterTts.getEngines;
      if (engines != null) {
        for (dynamic engine in engines) {
          print(engine);
        }
      }
    }
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
  }

  Future startFlowAudio() async {
    var currentPosition = currentPositionElement != null ? checkListItems.indexOf(currentPositionElement) : 0;
    for (int i = currentPosition; i < checkListItems.length; i++) {
      var element = checkListItems[i];
      _currentPositionElement.value = element;
      await speak(element.sparePartItem.name);
      var result = await startListening();
      print(result);
      onValueChange(element, statuses.firstWhere((element) => element.name.toLowerCase() == result.toLowerCase()));
      if (i == checkListItems.length - 1) {
        _currentPositionElement.nil();
        break;
      }
    }
  }

  Future speak(String _newVoiceText) async {
    print("speak: $_newVoiceText");
    if (flutterTts == null) {
      await setUpTTS();
    }

    if (_newVoiceText != null) {
      if (_newVoiceText.isNotEmpty) {
        await flutterTts.awaitSpeakCompletion(true);
        await flutterTts.speak(_newVoiceText);
      }
    }
  }

  Future<void> initSpeechState() async {
    await speech.value.initialize(onError: errorListener, onStatus: statusListener, debugLogging: true);
  }

  Future<String> startListening() async {
    var completer = Completer<String>();
    await speech.value.listen(
        onResult: (result) {
          completer.complete(result.recognizedWords);
        },
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 5),
        partialResults: false,
        localeId: _currentLocaleId.value,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    return completer.future;
  }

  void stopListening() {
    speech.value.stop();
    level.value = 0.0;
  }

  void cancelListening() {
    speech.value.cancel();
    level.value = 0.0;
  }

  void resultListener(SpeechRecognitionResult result) {
    resultListened.value = resultListened.value + 1;
    print('Result listener $resultListened');
    lastWords.value = '${result.recognizedWords} - ${result.finalResult}';
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    this.level.value = level;
  }

  void errorListener(SpeechRecognitionError error) {
    print("Received error status: $error, listening: ${speech.value.isListening}");
    lastError.value = '${error.errorMsg} - ${error.permanent}';
  }

  void statusListener(String status) {
    print('Received listener status: $status, listening: ${speech.value.isListening}');
    lastStatus.value = '$status';
  }

  void switchLang(selectedVal) {
    _currentLocaleId.value = selectedVal;
    print(selectedVal);
  }
}
