import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/backend/services/vehicle_service.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/input_user_vehicle/bottom_sheets/find_user_vehicle_result_bottom_sheet.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/input_user_vehicle/input_user_vehicle_bottom_sheet.dart';

@injectable
class InputUserVehicleBottomSheetModel extends BaseViewModel<InputUserVehicleBottomSheet> {
  final VehicleService vehicleService;

  InputUserVehicleBottomSheetModel(this.vehicleService);

  void findUserVehicle(String palateNumber) {
    call(() async {
      var result = (await vehicleService.getUserVehicles(plateNumber: palateNumber)).data;
      if (result.isNotEmpty) {
        Get.back();
        Get.bottomSheet(FindUserVehicleResultBottomSheet(vehicle: result.first,), isScrollControlled: true);
      } else {
        Fluttertoast.showToast(msg: "Không tìm thấy xe!");
      }
    });
  }
}
