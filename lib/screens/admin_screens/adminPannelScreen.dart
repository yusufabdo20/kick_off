import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/screens/admin_screens/number_of_calls_screen.dart';
import 'package:provider/provider.dart';

import '../../components/constants.dart';
import '../../state_management/ownerProviders/ownerProvidser.dart';

class AdminPannelScreen extends StatefulWidget {
  const AdminPannelScreen({super.key});

  @override
  State<AdminPannelScreen> createState() => _AdminPannelScreenState();
}

class _AdminPannelScreenState extends State<AdminPannelScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OwnerProvider>(context);

    var ownerItems = [
      AdminPannelComponent(
        icon: Icons.phone,
        number: provider.numberOfCalls,
        title: "Number of calls",
        report: "Reports",
        reportFunction: () {},
        onTapFunction: () {},
      ),
      AdminPannelComponent(
        icon: Icons.remove_red_eye_outlined,
        number: provider.numberOfViews,
        title: "Fields View",
        report: "Reports",
        reportFunction: () {},
      ),
      AdminPannelComponent(
        icon: Icons.location_on_outlined,
        number: provider.numberOfArea,
        title: "Areas",
      ),
      AdminPannelComponent(
        icon: Icons.sports_soccer_outlined,
        number: provider.numberOfClubs,
        title: "Soccer fields",
      ),
    ];
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome $adminName",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
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
                        Text(
                          provider.numberOfRequests.toString(),
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
                    children: ownerItems,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// List<AdminPannelComponent> items = [
//   AdminPannelComponent(
//     icon: Icons.phone,
//     number:12 ,
//     title: "Number of calls",
//     report: "Reports",
//     reportFunction: () {},
//     onTapFunction: () {},
//   ),
//   AdminPannelComponent(
//     icon: Icons.remove_red_eye_outlined,
//     number: 66,
//     title: "Fields View",
//     report: "Reports",
//     reportFunction: () {},
//   ),
//   AdminPannelComponent(
//     icon: Icons.location_on_outlined,
//     number: 100,
//     title: "Areas",
//   ),
//   AdminPannelComponent(
//     icon: Icons.shopping_cart_outlined,
//     number: 50,
//     title: "Soccer fields",
//   ),
// ];
}

class AdminPannelComponent extends StatelessWidget {
  IconData? icon;
  String? title;
  int? number;
  String? report;
  Function()? reportFunction;
  Function()? onTapFunction;
  AdminPannelComponent({
    context,
    required this.icon,
    required this.title,
    required this.number,
    this.onTapFunction,
    this.report,
    this.reportFunction,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<OwnerProvider>(
      builder: (context, value, child) {
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      fontSize: 35,
                      fontWeight: FontWeight.w900),
                ),
                report != null
                    ? TextButton(
                        onPressed: reportFunction,
                        child: Text(
                          report!,
                          style: TextStyle(
                              // decoration:TextDecoration.underline ,
                              color: Colors.blue[900],
                              fontSize: 12,
                              decoration: TextDecoration.underline
                              // fontWeight: FontWeight.w600
                              ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
