import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kick_off/components/components.dart';
import 'package:kick_off/screens/soccer_field_screen.dart';

class OwnerPlaygrounds extends StatelessWidget {
  OwnerPlaygrounds(
      {super.key,
      required this.nameOnwer,
      required this.nameArea,
      required this.price});
  String nameOnwer;
  String nameArea;
  int price;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
              image: AssetImage("assets/images/Playgrounds.png"),
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
                         color: Colors.
                         white,size: 15,
                         ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "$price EGP/ Hour",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                     const   Divider(
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
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 20,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
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
