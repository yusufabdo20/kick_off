import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../components/owner_playgrounds.dart';


class OwnerScreen extends StatelessWidget {
  const OwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined , color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "El-Salam fields",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            OwnerPlaygrounds(
              nameOnwer: 'El-Turky fileld ',
              nameArea: "Giza",
              price: 180,
            ),
            OwnerPlaygrounds(
              nameOnwer: 'El-Salam fileld ',
              nameArea: "Cairo",
              price: 150,
            ),
          ],
        ) ,),
    );
  }
}
