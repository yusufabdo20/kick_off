import 'package:flutter/material.dart';
import 'package:kick_off/components/admin_component/number_of_views.dart';



class NumbersOfViewsScreen extends StatelessWidget {
  const NumbersOfViewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "N.of Views",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text(
                        "N.of",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                      Text(
                        "Views",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "User",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                    Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "User",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                    Text(
                      "Phone",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ],
                ),
                Text(
                  "Date",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "Field Name",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            NumbersOfViewsComponent(
              nofViews: "1",
              userFname: "Diaa Eldien",
              userLname: "Essam",
              userPhone: "01153136656",
              date: "4/11/2023",
              hours: "11:15 PM",
              fieldName: "El salaam 2",
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            NumbersOfViewsComponent(
              nofViews: "1",
              userFname: "Diaa Eldien",
              userLname: "Essam",
              userPhone: "01153136656",
              date: "4/11/2023",
              hours: "11:15 PM",
              fieldName: "El salaam 2",
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            NumbersOfViewsComponent(
              nofViews: "2",
              userFname: "Yousef",
              userLname: "Hassan Amr",
              userPhone: "01153136656",
              date: "4/11/2023",
              hours: "11:15 PM",
              fieldName: "El Turky 2",
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            NumbersOfViewsComponent(
              nofViews: "2",
              userFname: "Youssef",
              userLname: "Hassan Amr",
              userPhone: "01153136656",
              date: "4/11/2023",
              hours: "11:15 PM",
              fieldName: "El Turky 2",
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            NumbersOfViewsComponent(
              nofViews: "3",
              userFname: "Youssef",
              userLname: "Essam",
              userPhone: "01153136656",
              date: "4/11/2023",
              hours: "11:15 PM",
              fieldName: "El salaam 2",
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            NumbersOfViewsComponent(
              nofViews: "3",
              userFname: "Yousef ",
              userLname: "Essam",
              userPhone: "01153136656",
              date: "4/11/2023",
              hours: "11:15 PM",
              fieldName: "El salaam 2",
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            
          ],
        ),
      ),
    );
  }
}
