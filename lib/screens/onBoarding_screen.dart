import 'package:flutter/material.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/screens/register_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../services/local/cash.dart';

class BoardingModel {
  String imagePath;
  String title;
  String body;
  BoardingModel({
    required this.imagePath,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  static String id = "on-boarding-screen";
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardings = [
    BoardingModel(
      imagePath: 'assets/images/whatsapp.png',
      title: "",
      body:
          "Now soccer fields become around you everywhere and you can call the owner directly or sent him message thru WhatsApp",
    ),
    BoardingModel(
        imagePath: 'assets/images/field.png',
        title: "",
        body:
            "You can view images of the soccer field and book online with only one click button"),
    BoardingModel(
      imagePath: 'assets/images/digital-marketing.png',
      title: "",
      body: "You can market your own soccer fields and track the kips",
    ),
  ];

  var boardingController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: buildHeadLine1Text(text: "KICK OFF"),
        centerTitle: true,
        actions: [
          TextButton(
              child: Text("Skip"),
              onPressed: () {
                submit();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              controller: boardingController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildBoardingItem(boardings[index]),
              itemCount: boardings.length,
              onPageChanged: (value) {
                if (value == boardings.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                  // print("Is Last Ya man") ;
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 100),
          Row(children: [
            SmoothPageIndicator(
              controller: boardingController, // PageController
              count: boardings.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 15,
                dotWidth: 15,
                expansionFactor: 3,
                spacing: 10,
                // dotColor: Colors.black54,
                // spacing:5.0,
                //  activeDotColor=defaultColor,
              ), // your preferred effect
              onDotClicked: (index) {},
            ),
            const Spacer(),
            FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {
                if (isLast == true) {
                  setState(() {
                    navigateTOAndReplacement(context, SignUpScreen());
                  });
                  submit();
                } else {
                  boardingController.nextPage(
                      duration: const Duration(milliseconds: 752),
                      curve: Curves.fastLinearToSlowEaseIn);
                }
              },
              child: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ])
        ]),
      ),
    );
  }

  void submit() {
    Cash.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateTOAndReplacement(
          context,
          SignUpScreen(),
        );
      }
    });
  }

  Widget buildBoardingItem(BoardingModel boardingModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image.asset(
                boardingModel.imagePath,
                width: 200,
                height: 200,
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          boardingModel.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          boardingModel.body,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
