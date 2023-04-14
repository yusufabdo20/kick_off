import 'package:flutter/material.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/components/owner_playgrounds.dart';
import 'package:kick_off/screens/user_screens/booking_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SoccerFieldScreen extends StatefulWidget {
  const SoccerFieldScreen({super.key});
  @override
  State<SoccerFieldScreen> createState() => _SoccerFieldScreenState();
}

class _SoccerFieldScreenState extends State<SoccerFieldScreen> {
  final Uri _whatsApp = Uri.parse("whatsapp://send?phone=+201151609669");

  Future<void> _launchUrl() async {
    if (!await launchUrl(_whatsApp)) {
      throw Exception('Could not launch $_whatsApp');
    }
  }

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
          "El-Salam fields",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
              size: 30,
            ),
            color: Colors.green.shade800,
            onPressed: _launchUrl,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OwnerPlaygrounds(
                nameOnwer: 'El-Turky fileld ',
                nameArea: "Giza",
                price: 180,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color:primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.checkroom_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "cafe",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
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
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xff072948),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.wc_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "WC",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
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
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff072948),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Only cash \$ \n El-salaam soccer fields at 9th maddi street \n Near to victoria school. ",
                      style: TextStyle(color: Colors.white, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff072948),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.error_outline_outlined,
                      color: Colors.white,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Closed in friday and thursday \n Accept only cash payment. ",
                          style: TextStyle(color: Colors.white, height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: "+20 155 291 0823",
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print("can not launch this url");
                  }
                },
                icon: Icon(
                  Icons.phone,
                ),
                label: Text("Calling"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff072948)),
                ),
              ),
              ElevatedButton.icon(
                onPressed: ()  {
                  // DateTime? pickedDate = await showDatePicker(
                  //     context: context,
                  //     initialDate: DateTime.now(),
                  //     firstDate: DateTime(2023),
                  //     //DateTime.now() - not to allow to choose before today.
                  //     lastDate: DateTime(2100));
                  // if (pickedDate != null) {
                  //   String formattedDate =
                  //       DateFormat('yyyy-MM-dd').format(pickedDate);
                  //   // controller.text = formattedDate; //set output date to TextField value.
                  //   print(formattedDate);
                  // }
                  navigateTO(context, BookingScreen());
                },
                
                icon: Icon(
                  Icons.book_online,
                ),
                label: Text("Book Now !"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff072948)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
