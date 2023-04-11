import 'package:flutter/material.dart';
import '../screens/home.dart';
import 'package:kick_off/screens/home_screen.dart';

import '../screens/register_screen.dart';
import '../screens/signIn_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes={
      SignUpScreen.id:(context) => SignUpScreen(),
      SignInScreen.id:(context) => SignInScreen(),
      // HomeScreen.id:(context) => HomeScreen(),
      Home.id:(context) => Home(),
      
    } ;