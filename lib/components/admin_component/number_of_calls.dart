import 'package:flutter/material.dart';

class NumbersOfCallsComponent extends StatelessWidget {
  NumbersOfCallsComponent(
      {super.key,
      required this.nofCalls,
      required this.userFname,
      required this.userLname,
      required this.userPhone,
      required this.date,
      required this.hours,
      required this.fieldName,
     });
  String nofCalls;
  String userFname;
  String userLname;
  String userPhone;
  String date;
  String hours;
  String fieldName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            nofCalls,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        Column(
          children: [
            Text(
              userFname,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            Text(
              userLname,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ],
        ),
        Text(
          userPhone,
          style: TextStyle(fontSize: 10, color: Colors.black),
        ),
        Column(
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            Text(
              hours,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            fieldName,
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
