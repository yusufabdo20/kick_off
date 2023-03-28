import 'package:flutter/material.dart';

import 'components/app_routes.dart';
import 'screens/register_screen.dart';
import 'screens/signIn_screen.dart';

void main() {
  runApp(KickOff());
}

class KickOff extends StatelessWidget {
  const KickOff({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignUpScreen.id,
      routes: appRoutes,
    );
  }
}
