import 'package:flutter/material.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/components/owner_playgrounds.dart';
import 'package:kick_off/components/soccer_field_components/address.dart';
import 'package:kick_off/components/soccer_field_components/nots.dart';
import 'package:kick_off/components/soccer_field_components/services.dart';
import 'package:kick_off/screens/user_screens/booking_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SoccerFieldScreen extends StatefulWidget {
   SoccerFieldScreen({super.key});

  @override
  State<SoccerFieldScreen> createState() => _SoccerFieldScreenState();
}

class _SoccerFieldScreenState extends State<SoccerFieldScreen> {
  Future<void> _launchUrl(String? phoneNumber) async {
    final Uri _whatsApp = Uri.parse("whatsapp://send?phone=+2$phoneNumber");
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
              onPressed: () {
                _launchUrl("01065666548");
              }),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back22.png" ,),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
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
                    Services(
                      ServiceIcon: Icons.checkroom_outlined,
                      ServiceNames: "Cafe",
                      ),
                    SizedBox(
                      width: 20,
                    ),
                    Services(
                      ServiceIcon: Icons.wc_outlined,
                      ServiceNames: "WC",
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Address(
                  AddressName: "Only cash \$ \n El-salaam soccer fields at 9th maddi street \n Near to victoria school. ",
                  ),
                SizedBox(
                  height: 20,
                ),
                Nots(
                  NotsName: "Closed in friday and thursday. \n Accept only cash payment. ",
                  ),
                  SizedBox(
                  height: 20,
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
                  label: Text("Calling        "),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff072948)),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
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
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff072948)),
                  ),
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
