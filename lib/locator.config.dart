// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'backend/auth_manager.dart';
import 'storage/auth_storage.dart';
import 'backend/services/branch_service.dart';
import 'ui/screen/maintenance/user_vehicle_info/views/confirm_start_dialog/confirm_maintenance_start_dialog_model.dart';
import 'fcm/fcm_manager.dart';
import 'backend/services/fcm_service.dart';
import 'storage/fcm_token_storage.dart';
import 'ui/screen/history/history_screen_model.dart';
import 'backend/http_client.dart';
import 'ui/screen/maintenance/input_user_vehicle/input_user_vehicle_bottom_sheet_model.dart';
import 'ui/screen/login/login_screen_model.dart';
import 'ui/screen/main/main_screen_model.dart';
import 'ui/screen/maintenance/maintenance/schedule/maintenance_schedule_screen_model.dart';
import 'backend/services/maintenance_service.dart';
import 'ui/screen/maintenance/maintenance/service/maintenance_service_screen_model.dart';
import 'ui/screen/profile/profile_screen_model.dart';
import 'ui/screen/maintenance/maintenance/receive/receive_vehicle_screen_model.dart';
import 'ui/screen/maintenance/maintenance/sparepart_check/sparepart_check_screen_model.dart';
import 'ui/screen/spash/splash_screen_model.dart';
import 'storage/user_storage.dart';
import 'backend/services/user_service.dart';
import 'ui/screen/maintenance/user_vehicle_info/user_vehicle_detail_screen_model.dart';
import 'backend/services/utils_service.dart';
import 'backend/services/vehicle_service.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<AuthManager>(() => AuthManager());
  gh.lazySingleton<AuthStorage>(() => AuthStorage(get<SharedPreferences>()));
  gh.lazySingleton<BranchService>(() => BranchService());
  gh.lazySingleton<FcmManager>(() => FcmManager());
  gh.lazySingleton<FcmService>(() => FcmService());
  gh.lazySingleton<FcmTokenStorage>(
      () => FcmTokenStorage(get<SharedPreferences>()));
  gh.lazySingleton<HttpClient>(() => HttpClient());
  gh.lazySingleton<MainScreenModel>(() => MainScreenModel());
  gh.lazySingleton<MaintenanceService>(() => MaintenanceService());
  gh.factory<SplashScreenModel>(
      () => SplashScreenModel(get<FcmManager>(), get<AuthManager>()));
  gh.lazySingleton<UserIdStorage>(
      () => UserIdStorage(get<SharedPreferences>()));
  gh.lazySingleton<UserService>(() => UserService());
  gh.lazySingleton<UtilsService>(() => UtilsService());
  gh.lazySingleton<VehicleService>(() => VehicleService());
  gh.factory<ConfirmMaintenanceStartDialogModel>(
      () => ConfirmMaintenanceStartDialogModel(get<MaintenanceService>()));
  gh.factory<HistoryScreenModel>(
      () => HistoryScreenModel(get<MaintenanceService>()));
  gh.factory<InputUserVehicleBottomSheetModel>(
      () => InputUserVehicleBottomSheetModel(get<VehicleService>()));
  gh.factory<LoginScreenModel>(() => LoginScreenModel(get<UserService>()));
  gh.factory<MaintenanceScheduleScreenModel>(
      () => MaintenanceScheduleScreenModel(get<MaintenanceService>()));
  gh.factory<MaintenanceServiceScreenModel>(() => MaintenanceServiceScreenModel(
        get<MaintenanceService>(),
        get<VehicleService>(),
        get<BranchService>(),
      ));
  gh.factory<ProfileScreenModel>(() => ProfileScreenModel(get<UserService>()));
  gh.factory<ReceiveVehicleScreenModel>(() => ReceiveVehicleScreenModel(
      get<UtilsService>(), get<MaintenanceService>()));
  gh.factory<SparepartCheckScreenModel>(() => SparepartCheckScreenModel(
      get<MaintenanceService>(), get<VehicleService>()));
  gh.factory<UserVehicleDetailScreenModel>(() => UserVehicleDetailScreenModel(
      get<VehicleService>(), get<MaintenanceService>()));
  return get;
}
