import 'package:flutter/material.dart';
import 'package:kick_off/components/home_component/Search_field.dart';
import 'package:kick_off/components/home_component/areas_categories.dart';
import 'package:kick_off/components/home_component/playgrounds_categories.dart';
import '../../components/components.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              navigateTO(context, NotificationsScreen());
            },
            icon: Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: Color(0xff3A3A3A),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const SearchTextField(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Area",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Select all",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                AreasCategories(
                                  name: "Cairo",
                                ),
                                AreasCategories(
                                  name: "Alex",
                                ),
                                AreasCategories(
                                  name: "Matro",
                                ),
                                AreasCategories(
                                  name: "Giza",
                                ),
                                AreasCategories(
                                  name: "Giza",
                                ),
                                AreasCategories(
                                  name: "Giza",
                                ),
                                AreasCategories(
                                  name: "Giza",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nearest Soccer fields",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    // textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PlaygroundsCategories(
                    nameOnwer: "El-salam fields",
                    nameArea: "Cairo",
                  ),
                  PlaygroundsCategories(
                    nameOnwer: "El-Turky fields",
                    nameArea: "Alex",
                  ),
                  PlaygroundsCategories(
                    nameOnwer: "abo elnawer fields",
                    nameArea: "Matro",
                  ),
                  PlaygroundsCategories(
                    nameOnwer: "El-salam fields",
                    nameArea: "Giza",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
