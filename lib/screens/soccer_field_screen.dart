import 'package:flutter/material.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/components/owner_playgrounds.dart';
import 'package:kick_off/components/soccer_field_components/address.dart';
import 'package:kick_off/components/soccer_field_components/nots.dart';
import 'package:kick_off/components/soccer_field_components/services.dart';
import 'package:kick_off/models/areaModel.dart';
import 'package:kick_off/screens/user_screens/booking_screen.dart';
import 'package:kick_off/state_management/areaProvider.dart';
import 'package:kick_off/state_management/clubProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SoccerFieldScreen(id: 12),
              ),
            );
          },
          child: Text('Show Stadium'),
        ),
      ),
    );
  }
}

class SoccerFieldScreen extends StatelessWidget {
  SoccerFieldScreen({required this.id});
  final int id;

  Future<void> _launchUrl(String? phoneNumber) async {
    final Uri _whatsApp = Uri.parse("whatsapp://send?phone=+2$phoneNumber");
    if (!await launchUrl(_whatsApp)) {
      throw Exception('Could not launch $_whatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClubProvider>(context);
    var cities = Provider.of<AreaProvider>(context).cities;
    int? areaID = provider.specificClub.areaId;
    String areaName = '';
    final matchingCities = cities.where((city) => city.id == areaID);
    if (matchingCities.isNotEmpty) {
      areaName = matchingCities.first.name;
    }
    provider.getSpecificClub(id);
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
                _launchUrl("01065666548");
              }),
        ],
      ),
      body: Center(
          child: provider.ownerClubs != null
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
                          OwnerPlaygrounds(
                            id: provider.specificClub.id!,
                            nameOnwer: provider.specificClub.name!,
                            nameArea: areaName,
                            price: provider.specificClub.price!,
                          ),
                          Row(
                            children: [
                              provider.specificClub.cafe == 1
                                  ? Services(
                                      ServiceIcon: Icons.checkroom_outlined,
                                      ServiceNames: "Cafe",
                                    )
                                  : Container(),
                              const SizedBox(
                                width: 20,
                              ),
                              provider.specificClub.wc == 1
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
                            AddressName:
                                "Only cash \$ \n El-salaam soccer fields at 9th maddi street \n Near to victoria school. ",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Nots(
                            NotsName:
                                "Closed in friday and thursday. \n Accept only cash payment. ",
                          ),
                          const SizedBox(
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
              : const CircularProgressIndicator()),
    );
  }
}
