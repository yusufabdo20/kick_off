import 'package:flutter/material.dart';

class Services extends StatelessWidget {
   Services({required this.ServiceIcon , required this.ServiceNames});
  IconData ServiceIcon;
  String ServiceNames;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xff072948),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(
                ServiceIcon,
                color: Colors.white,
              ),
              Text(
                ServiceNames,
                style: TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.check_circle_outline_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
