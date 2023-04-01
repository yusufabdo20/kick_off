import 'package:flutter/material.dart';
import 'package:kick_off/screens/home.dart';
import 'components/app_routes.dart';

void main() {
  runApp(KickOff());
}

class KickOff extends StatelessWidget {
  const KickOff({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.id,
      routes: appRoutes,
    );
  }
}
