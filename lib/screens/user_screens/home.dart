import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/screens/logout.dart';

import 'favorites_screen.dart';
import 'home_screen.dart';
import 'requests_screen.dart';
import 'settings_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // final List<String> _titles = <String>[
  //   "Home",
  //   "Requests",
  //   "Favorites",
  //   "Settings",
   
  // ];

  final List<Widget> _tabs = <Widget>[
    const HomeScreen(),
    const RequestsScreen(),
    const FavoritesScreen(),
     LogoutScreen(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:  Text(_titles[_selectedIndex]),
      // ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar:
       Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.1),
              ),
            ]),
         child: SafeArea(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 8),
             child: GNav(
              onTabChange: (newIndex) {
                setState(() {
                  _selectedIndex = newIndex ; 
                });
              },
                gap: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),       
                activeColor: Colors.black,
                duration: const Duration(milliseconds: 300),
                tabBackgroundColor: Colors.grey[100]!,
                iconSize: 24,
                curve: Curves.easeInExpo,
                color: Colors.white,
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: "Home",
                  ),
                  GButton(
                    icon: Icons.list_alt_outlined,
                    text: "Requests",
                  ),
                  GButton(
                    icon: Icons.favorite_outline_rounded,
                    text: "Favorites",
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: "Settings",
                  ),
                  
                ]),
           ),
         ),
       ),
    );
  }
}
