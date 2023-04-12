import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kick_off/components/components.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildDatePickerTextField(
      lable:"yyyy" ,
      hint: "gggg",
      calenderIconColor:Colors.amber ,
      validator:20 ,
      context:80 ,
      controller:TextEditingController() ,
      ),
    );
  }
}