import 'package:staff_maintenance_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staff_maintenance_app/ui/screen/spash/splash_screen.dart';

const String vi = "vi";

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupEasyLoading();
  await initSharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: 'Bảo dưỡng xe (App Nhân viên)',
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return FlutterEasyLoading(child: child);
      },
      home: SplashScreen(),
    );
  }
}

void setupEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blueAccent
    ..progressColor = Colors.blueAccent
    ..userInteractions = false
    ..textColor = Colors.black;
}
