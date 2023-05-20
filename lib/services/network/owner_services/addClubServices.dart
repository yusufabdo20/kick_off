import 'dart:io';

import 'package:kick_off/components/constants.dart';
import 'package:kick_off/services/api.dart';

class AddClubServices {
  Future<Map<String, dynamic>> addClub({
    required String price,
    required String name,
    String? wc,
    String? cafe,
    required File image,
    required String phone,
    String? area_id,
    String? address,
    String? notes,
  }) async {
    var data = await Api().muliPartPost(
      apiUrl: "$baseUrl/club",
      body: {
        'price': price,
        'name': name,
        'phone': phone,
        'image': image,
        'wc': wc,
        "cafe": cafe,
        'area_id': area_id,
        'address': address,
        'notes': notes,
      },
      token: 'Bearar $userToken'
    );
    // image = await Api()
    //     .muliPartPost(apiUrl: "$baseUrl/club", body: {'image': image});
    // print(image);
    print(" Addin Club in AddClub Sevices File >>>>> $data");
    return data;
  }
}
