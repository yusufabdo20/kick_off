import 'package:flutter/material.dart';
import 'package:kick_off/screens/onBoarding_screen.dart';

   import '../screens/register_screen.dart';
import '../screens/signIn_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  SignUpScreen.id: (context) => SignUpScreen(),
  SignInScreen.id: (context) => SignInScreen(),
  // ChooceAdminOrUserScreen.id: (context) => ChooceAdminOrUserScreen(),
  OnBoardingScreen.id: (context) => OnBoardingScreen(),
  // MySelector.id: (context) => MySelector(items: []),
};
