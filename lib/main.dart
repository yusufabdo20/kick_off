import 'package:flutter/material.dart';
import 'package:kick_off/screens/admin_screens/admin_pannel.dart';
import 'package:kick_off/screens/user_screens/home.dart';
import 'package:kick_off/state_management/areaProvider.dart';
import 'package:kick_off/state_management/userProvider.dart';
import 'package:provider/provider.dart';

import 'components/app_routes.dart';
import 'screens/admin_screens/ImagePicker.dart';
import 'screens/admin_screens/add_soccer_field.dart';
import 'screens/admin_screens/adminPannelScreen.dart';
import 'screens/onBoarding_screen.dart';
import 'screens/register_screen.dart';
import 'screens/signIn_screen.dart';
import 'screens/soccer_field_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/user_screens/booking_screen.dart';
import 'screens/user_screens/owner_clubs_screen.dart';
import 'services/local/cash.dart';
import 'components/app_routes.dart';
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
  runApp(
       ChangeNotifierProvider(
        create: (_) => AreaProvider(),
        child: KickOff(startWidget: widget),
      ),
    // MultiProvider(providers: [
    //   ChangeNotifierProvider(
    //     create: (_) => UserProvider(),
    //     child: KickOff(startWidget: widget),
    //   ),
    //   ChangeNotifierProvider(
    //     create: (_) => ClubProvider(),
    //     child: KickOff(startWidget: widget),
    //   ),
    // ]),
  );
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
      home: SoccerFieldScreen(),
    );
  }
}
