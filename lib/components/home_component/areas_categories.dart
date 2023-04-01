import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AreasCategories extends StatelessWidget {
  AreasCategories({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      // width: 120,
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(4, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 36,
              // width: 50,
              child: Image.asset(
                "assets/images/location.png",
                color: Color(0xff47648c),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff5D5D5D),
              ),
            ),
          ],
        ),
      ),
      margin: EdgeInsets.only(
        left: 10,
      ),
    );
  }
}

