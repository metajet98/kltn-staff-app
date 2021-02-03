import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/backend/services/maintenance_service.dart';
import 'package:staff_maintenance_app/backend/services/utils_service.dart';
import 'package:staff_maintenance_app/event_bus.dart';
import 'package:staff_maintenance_app/events/event_maintenance_created.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/receive/receive_vehicle_screen.dart';

@injectable
class ReceiveVehicleScreenModel extends BaseViewModel<ReceiveVehicleScreen> {
  final UtilsService utilsService;
  final MaintenanceService maintenanceService;

  ReceiveVehicleScreenModel(this.utilsService, this.maintenanceService);

  final _images = RxList<String>([]);
  final _motorWash = RxInt(0);
  final _sparepartBack = RxBool(true);

  List<String> get images => _images.value;
  int get motorWash => _motorWash.value;
  bool get sparepartBack => _sparepartBack.value;

  set motorWash(int value) {
    _motorWash.value = value;
  }

  set sparepartBack(bool value) {
    _sparepartBack.value = value;
  }

  int userVehicleId;

  int odometer = 0;
  String notes;
  String title;

  void removeImage(String imageUrl) {
    _images.removeWhere((element) => element == imageUrl);
    _images.refresh();
  }

  Future onAddImagePressed() async {
    var pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if(pickedFile == null) return;
    var file = File(pickedFile.path);
    call(() async {
      var result = await utilsService.uploadImage(file: file);
      _images.add(result.data as String);
    }, background: false, toastOnError: true);
  }

  Future createMaintenance() async {
    var params = <String, dynamic> {
      "Images": images,
      "Notes" : notes,
      "Odometer": odometer,
      "UserVehicleId": userVehicleId,
      "MotorWash": motorWash,
      "SparepartBack": sparepartBack,
      "Title" : title.isNullOrBlank ? "Bảo dưỡng định kì" : title,
    };

    call(() async {
      var result = await maintenanceService.createMaintenance(params: params);
      eventBus.fire(EventMaintenanceCreated());
      Get.back();
    }, background: false, toastOnError: true);
  }
}
