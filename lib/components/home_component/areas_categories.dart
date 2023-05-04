import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AreasCategories extends StatelessWidget {
  AreasCategories({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(

        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius:5,
              offset: Offset(2, 3.5),
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
                  color: const Color(0xff47648c),
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff5D5D5D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

