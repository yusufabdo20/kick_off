import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/screens/admin_screens/number_of_calls_screen.dart';

import '../../components/constants.dart';

class AdminPannelScreen extends StatefulWidget {
  const AdminPannelScreen({super.key});

  @override
  State<AdminPannelScreen> createState() => _AdminPannelScreenState();
}

class _AdminPannelScreenState extends State<AdminPannelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/back33.png"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Welcome \n Admin",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
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
                          child: const Text("2",
                              style: TextStyle(color: Colors.white)),
                          maxRadius: 10,
                          backgroundColor: Colors.yellow[800],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/back1.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.receipt),
                              const Text(
                                'Requests',
                                style: TextStyle(
                                    // color: Colors.red,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const Text(
                          "2",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 1,
                    padding: const EdgeInsets.all(10.0),
                    children: items,
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
      ),
    );
  }
}

List<AdminPannelComponent> items = [
  AdminPannelComponent(
    icon: Icons.phone,
    number: 190,
    title: "Number of calls",
    report: "Reports",
    reportFunction: () {},
    onTapFunction: () {},
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

class AdminPannelComponent extends StatelessWidget {
  IconData? icon;
  String? title;
  int? number;
  String? report;
  Function()? reportFunction;
  Function()? onTapFunction;
  AdminPannelComponent({
    required this.icon,
    required this.title,
    required this.number,
    this.onTapFunction,
    this.report,
    this.reportFunction,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
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
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$number",
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            report != null
                ? TextButton(
                    onPressed: reportFunction,
                    child: Text(
                      report!,
                      style: const TextStyle(
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
      ),
    );
  }
}
