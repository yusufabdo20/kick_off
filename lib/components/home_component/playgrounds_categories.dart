import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'package:kick_off/components/components.dart';
import 'package:kick_off/state_management/clubProvider.dart';

import '../../screens/user_screens/owner_clubs_screen.dart';

class HomePlaygroundsCategories extends StatelessWidget {
  String nameOnwer;
  String nameArea;
  String image;
  String rate;
  int? price;

  HomePlaygroundsCategories(
      {super.key,
      required this.nameOnwer,
      required this.nameArea,
      required this.image,
      this.price,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    final clubs = Provider.of<ClubProvider>(context).allClubs;
    var adminId;
    final matchingClubs = clubs.where((club) => adminId ==club.adminId );
    if (matchingClubs.isNotEmpty) {
      adminId = matchingClubs.first.adminId;
    }
    return InkWell(
      onTap: () {
        navigateTO(
            context,
            OwnerScreen(
              adminId: 1,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xff496179).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(
                        nameArea,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      price != null
                          ? Text(
                              '$price Egy/hou',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                RatingBar.builder(
                  tapOnlyMode: true,
                  initialRating: double.parse(rate),
                  minRating: 0,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemSize: 20,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // double.parse(rate) = rating;
                    print(rate);
                  },
                ),
              ],
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff224A4A).withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nameOnwer,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Text(
                      "Click for More filelds",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
