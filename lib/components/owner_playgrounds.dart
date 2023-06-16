import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/screens/specific_soccer_field_screen.dart';
import 'package:kick_off/state_management/clubProvider.dart';
import 'package:provider/provider.dart';

class OwnerPlaygrounds extends StatelessWidget {
  OwnerPlaygrounds(
      {super.key,
      required this.nameOnwer,
      required this.nameArea,
      required this.price,
      required this.id,
      required this.image,
      required this.rate});
  String nameOnwer;
  String nameArea;
  int price;
  int id;
  String image;
  int rate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Provider.of<ClubProvider>(context, listen: false)
            .getSpecificClub();
        navigateTO(context, SoccerFieldScreen());
      },
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          // margin: EdgeInsets.only(bottom: 5),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xff496179).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                nameArea,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$price EGP/ Hour",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const Divider(
                          thickness: 5.0,
                          height: 10,
                          color: Colors.black,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Text(
                          nameOnwer,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        
              Padding(
                padding: const EdgeInsets.all(10),
                child: RatingBar.builder(
                  initialRating: (rate).toDouble(),
                  minRating: (rate).toDouble(),
                  maxRating: (rate).toDouble(),
                  direction: Axis.horizontal,
                  itemSize: 20,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
              // Container(
              //   height: 40,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Color(0xff224A4A).withOpacity(0.8),
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(20),
              //       bottomRight: Radius.circular(20),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           nameOnwer,
              //           style: TextStyle(color: Colors.white, fontSize: 16),
              //         ),
              //         Text(
              //           "Click for More filelds",
              //           style: TextStyle(color: Colors.white, fontSize: 16),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
