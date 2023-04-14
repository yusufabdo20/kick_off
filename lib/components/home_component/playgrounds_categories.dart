import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kick_off/components/components.dart';

import '../../screens/user_screens/owner_clubs_screen.dart';

class PlaygroundsCategories extends StatelessWidget {
  String nameOnwer;
  String nameArea;
  String image;
  String rate;

  PlaygroundsCategories(
      {super.key,
      required this.nameOnwer,
      required this.nameArea,
      required this.image,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTO(context, OwnerScreen());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('$image'),
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
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xff496179).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          nameArea,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
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
                color: Color(0xff224A4A).withOpacity(0.8),
                borderRadius: BorderRadius.only(
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
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
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
