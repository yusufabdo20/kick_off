import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SpecificClubCategory extends StatelessWidget {
  SpecificClubCategory({
    super.key,
    required this.nameOnwer,
    required this.nameArea,
    required this.price,
    required this.id,
    required this.image,
    required this.rate,
  });
  String nameOnwer;
  String nameArea;
  int price;
  int id;
  int rate;
  String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        // margin: EdgeInsets.only(bottom: 5),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: NetworkImage(image),
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
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xff496179).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            nameArea,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "$price Egp/ Hour",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        nameOnwer,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                // allowHalfRating: true,
                itemSize: 20,
                ignoreGestures: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
