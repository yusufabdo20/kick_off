import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff082D4F),
        elevation: 0,
        title: const Text(
          "NotificationsScreen",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/no-alarm.png"),
            const Text(
              "Don't have any NotificationsScreen",
              style: TextStyle(
                color: Color(0xff082D4F),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
