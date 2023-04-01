import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kick_off/components/constants.dart';

class AdminPannelScreen extends StatefulWidget {
  @override
  State<AdminPannelScreen> createState() => _AdminPannelScreenState();
}

class _AdminPannelScreenState extends State<AdminPannelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Welcome \n Admin",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.black,
                          size: 30,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset.fromDirection(1.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        child: Text("2", style: TextStyle(color: Colors.white)),
                        maxRadius: 10,
                        backgroundColor: Colors.yellow[800],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(10),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.receipt),
                          Text(
                            'Requests',
                            style: TextStyle(
                                // color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "2",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
              
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  // crossAxisSpacing: 10.0,
                  // padding: EdgeInsets.all(10.0),
                  children:items,
                ),
              ),
              // GridView.builder(
              //   itemCount: items.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 5.0,
              //     crossAxisSpacing: 5.0,
              //     childAspectRatio: 1.0,
              //   ),
              //   itemBuilder: (BuildContext context, int index) {
              //     return items[index];
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  List<AdminPannelComponent> items = [
    AdminPannelComponent(
      icon: Icons.abc_rounded,
      number: 100,
      title: "HI Admin",
    ),
    AdminPannelComponent(
      icon: Icons.abc_rounded,
      number: 100,
      title: "HI Admin",
    ),
    AdminPannelComponent(
      icon: Icons.abc_rounded,
      number: 100,
      title: "HI Admin",
    ),
    AdminPannelComponent(
      icon: Icons.abc_rounded,
      number: 100,
      title: "HI Admin",
    ),
    AdminPannelComponent(
      icon: Icons.abc_rounded,
      number: 100,
      title: "HI Admin",
    ),
    AdminPannelComponent(
      icon: Icons.abc_rounded,
      number: 100,
      title: "HI Admin",
    ),
  ];
}

class AdminPannelComponent extends StatelessWidget {
  IconData? icon;
  String? title;
  int? number;
  // String? report ,
  Function()? reportFunction;
  AdminPannelComponent(
      {required this.icon,
      required this.title,
      required this.number,
      this.reportFunction});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: primaryColor,
          ),
          Text(
            "Title",
            style: TextStyle(
                color: primaryColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "Numbers",
            style: TextStyle(
                color: primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: reportFunction,
            child: Text(
              "Report",
              style: TextStyle(
                  color: primaryColor,
                  // fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
