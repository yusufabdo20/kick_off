import 'package:flutter/material.dart';
import 'package:kick_off/screens/admin_screens/admin_pannel.dart';
import 'package:kick_off/state_management/userProvider.dart';
import 'package:provider/provider.dart';

import 'components/app_routes.dart';
import 'screens/admin_screens/ImagePicker.dart';
import 'screens/admin_screens/add_soccer_field.dart';
import 'screens/admin_screens/adminPannelScreen.dart';
import 'screens/onBoarding_screen.dart';
import 'screens/register_screen.dart';
import 'screens/signIn_screen.dart';
import 'screens/splash_screen.dart';
import 'services/local/cash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Cash.init();
  bool? onBoarding = Cash.getData(key: "onBoarding");
  String? token = Cash.getData(key: "userToken");
  Widget widget;

  if (onBoarding != null) {
    if (token != null) {
      widget = SignUpScreen();
    } else {
      widget = SignInScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(
    ChangeNotifierProvider(
      create: (_) => USerProvider(),
      child: KickOff(),
    ),
  );
}

class KickOff extends StatelessWidget {
  const KickOff({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: SplashScreen.id,
      // routes: appRoutes,
      home: AddSoccerFieldScreen(),
    );
  }
}
