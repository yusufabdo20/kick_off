import 'package:flutter/material.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/screens/admin_screens/adminPannelScreen.dart';
import 'package:kick_off/screens/admin_screens/admin_pannel.dart';
import 'package:kick_off/screens/signIn_screen.dart';

import 'package:kick_off/screens/user_screens/home.dart';

import 'package:kick_off/state_management/areaProvider.dart';
import 'package:kick_off/state_management/ownerProviders/ownerProvidser.dart';
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
  userToken = Cash.getData(key: "userToken");
  print(Cash.getData(key: "userToken")) ;
  // userToken = SharedPreferencesHelper.getUserToken();
  // bool? isOwner =SharedPreferencesHelper.getIsOwner();
   bool? isOwner = Cash.getData(key: 'isOwner');
   print('Cash IS OWNER >>>>'+ isOwner.toString()) ;
  Widget widget;

  if (onBoarding != null) {
    if (userToken != null) {
      if (isOwner == true) {
        widget = AdminHomeScreen();
      } else {
        widget = Home();
      }
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
      ChangeNotifierProvider<OwnerProvider>(create: (_) => OwnerProvider()),
      // ChangeNotifierProvider<ApiProvider>(create: (_) => ApiProvider()),
      // ChangeNotifierProvider(create: (_) => AreaProvider()),
    ],
    child: KickOff(startWidget: widget),
  ));
}

class KickOff extends StatelessWidget {
  Widget? startWidget;
  KickOff({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:startWidget,
    );
  }
}
