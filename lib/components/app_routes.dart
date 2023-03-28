import 'package:flutter/material.dart';

import '../screens/register_screen.dart';
import '../screens/signIn_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes={
      SignUpScreen.id:(context) => SignUpScreen(),
      SignInScreen.id:(context) => SignInScreen(),
    } ;