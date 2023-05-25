import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/screens/admin_screens/ImagePicker.dart';
import 'package:kick_off/screens/admin_screens/add_services.dart';
import 'package:kick_off/screens/admin_screens/add_soccer_field.dart';
import 'package:kick_off/screens/logout.dart';
import 'package:kick_off/screens/signIn_screen.dart';

import '../register_screen.dart';
import 'adminPannelScreen.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  State<AdminHomeScreen> createState() => _AdminPannelScreenState();
}

class _AdminPannelScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 2;

  final List<Widget> _widgetOptions = [
    LogoutScreen(),
    Text("Reports Screen"),
    AddSoccerFieldScreen(),
    Text("Fields Screen"),
    AdminPannelScreen(),
    // MyWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: GNav(
            backgroundColor: primaryColor,
            color: Colors.white,
            // curve: Curves.easeInOut,
            activeColor: primaryColor,
            tabBackgroundColor: Colors.white,
            tabMargin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            padding: EdgeInsets.all(10),
            gap: 5,
            selectedIndex: _selectedIndex,
            onTabChange: (value) {
              _onItemTapped(value);
            },
            tabs: [
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
              GButton(
                icon: Icons.file_copy,
                text: "Reports",
              ),
              GButton(
                icon: Icons.add,
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: "Fields",
              ),
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
            ]),
      ),
    );
  }

  List<AdminPannelComponent> items = [
    AdminPannelComponent(
      icon: Icons.phone,
      number: 190,
      title: "Number of calls",
      report: "Reports",
      reportFunction: () {},
    ),
    AdminPannelComponent(
      icon: Icons.remove_red_eye_outlined,
      number: 66,
      title: "Fields View",
      report: "Reports",
      reportFunction: () {},
    ),
    AdminPannelComponent(
      icon: Icons.location_on_outlined,
      number: 100,
      title: "Areas",
    ),
    AdminPannelComponent(
      icon: Icons.shopping_cart_outlined,
      number: 50,
      title: "Soccer fields",
    ),
  ];
}

class AdminPannelComponent extends StatelessWidget {
  IconData? icon;
  String? title;
  int? number;
  String? report;
  Function()? reportFunction;
  AdminPannelComponent(
      {required this.icon,
      required this.title,
      required this.number,
      this.report,
      this.reportFunction});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 25,
            color: primaryColor,
          ),
          Text(
            title!,
            style: const TextStyle(
                color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "$number",
            style: const TextStyle(
                color: primaryColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          report != null
              ? TextButton(
                  onPressed: reportFunction,
                  child: Text(
                    report!,
                    style: TextStyle(
                      // decoration:TextDecoration.underline ,
                      color: Colors.black54,
                      fontSize: 14,
                      // fontWeight: FontWeight.w600
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
