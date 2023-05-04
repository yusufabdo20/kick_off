import 'package:flutter/material.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/screens/soccer_field_screen.dart';

import 'package:kick_off/screens/user_screens/home.dart';

import 'package:kick_off/state_management/areaProvider.dart';
import 'package:kick_off/z.dart';
import 'package:provider/provider.dart';

import 'screens/onBoarding_screen.dart';
import 'screens/register_screen.dart';

import 'services/local/cash.dart';

import 'state_management/clubProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Cash.init();
  bool? onBoarding = Cash.getData(key: "onBoarding");
  String? token = Cash.getData(key: "userToken");
  Widget widget;

  if (onBoarding != null) {
    if (token != null) {
      widget = Home();
    } else {
      widget = SignUpScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AreaProvider>(create: (_) => AreaProvider()),
      ChangeNotifierProvider<ClubProvider>(create: (_) => ClubProvider()),
      // ChangeNotifierProvider<CitiesProvider>(create: (_) => CitiesProvider()),
      // ChangeNotifierProvider(create: (_) => AreaProvider()),
    ],
    child: KickOff(startWidget:widget),
  ));
}

class KickOff extends StatelessWidget {
  Widget? startWidget;
  KickOff({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: SplashScreen.id,
      // routes: appRoutes,
      home:startWidget,
    );
  }
}
