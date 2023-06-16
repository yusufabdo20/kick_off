import 'package:flutter/material.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/components/soccer_field_components/address.dart';
import 'package:kick_off/components/soccer_field_components/nots.dart';
import 'package:kick_off/components/soccer_field_components/services.dart';
import 'package:kick_off/screens/specificClubCategory.dart';
import 'package:kick_off/screens/user_screens/booking_screen.dart';
import 'package:kick_off/state_management/areaProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/network/user_services/callingServices.dart';
import '../state_management/clubProvider.dart';

class SoccerFieldScreen extends StatelessWidget {
  // SoccerFieldScreen({required this.id});
  // int id;

  Future<void> _launchUrl(String? phoneNumber) async {
    final Uri _whatsApp = Uri.parse("whatsapp://send?phone=+2$phoneNumber");
    if (!await launchUrl(_whatsApp)) {
      throw Exception('Could not launch $_whatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    final clubProvider = Provider.of<ClubProvider>(context);
    final cities = Provider.of<AreaProvider>(context).cities;
    var specificClub = clubProvider.specificClub[0];
    int areaID = Provider.of<ClubProvider>(context).specificClub[0].areaId!;
    String? areaName;
    final matchingCities =
        cities.where((city) => city.id == specificClub.areaId);
    if (matchingCities.isNotEmpty) {
      areaName = matchingCities.first.name;
    }
    // clubProvider.getSpecificClub(id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Soccer Field",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.whatsapp,
                size: 30,
              ),
              color: Colors.green.shade800,
              onPressed: () {
                _launchUrl(specificClub.admin.phone);
              }),
        ],
      ),
      body: Center(
        child: clubProvider.ownerClubs != null
            ? Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/back22.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SpecificClubCategory(
                          id: specificClub.id!,
                          // clubProvider.specificClub.id!,
                          nameOnwer: specificClub.name!,
                          nameArea: areaName!,
                          price: specificClub.price!,
                          image: specificClub.image!,
                          rate: specificClub.rate!,
                        ),
                        Row(
                          children: [
                            specificClub.cafe == 1
                                ? Services(
                                    ServiceIcon: Icons.checkroom_outlined,
                                    ServiceNames: "Cafe",
                                  )
                                : Container(),
                            const SizedBox(
                              width: 20,
                            ),
                            specificClub.wc == 1
                                ? Services(
                                    ServiceIcon: Icons.wc_outlined,
                                    ServiceNames: "WC",
                                  )
                                : Container(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Address(
                          AddressName: specificClub.address ?? 'No Address',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Nots(
                          NotsName: specificClub.address ?? 'No Notes',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            CallingClubService().callingClub(
                                specificClub.id!, specificClub.adminId!);
                            final Uri url = Uri(
                              scheme: "tel",
                              path: specificClub.admin.phone,
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("can not launch this url");
                            }
                                 CallingClubService().callingClub(
                                specificClub.id!, specificClub.adminId!);
                          },
                          icon: const Icon(
                            Icons.phone,
                          ),
                          label: const Text("Calling        "),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff072948)),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            navigateTO(
                                context,
                                BookingScreen(
                                  club_id: specificClub.id!,
                                ));
                          },
                          icon: const Icon(
                            Icons.book_online,
                          ),
                          label: const Text("Book Now !"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff072948)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
