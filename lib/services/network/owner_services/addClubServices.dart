import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../components/constants.dart';
import '../../api.dart';

class AddClubServices {
  Future<String> base64Image(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<void> postData(String name, double price, File imageFile) async {
    final url = 'https://example.com/api/create-product';

    // Encode image file to base64 string
    final imageString = await base64Image(imageFile);

    // Set up request headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    // Set up request body
    Map<String, dynamic> requestBody = {
      'name': name,
      'price': price,
      'image': imageString,
    };

    // Send HTTP POST request
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(requestBody),
    );

    // Check response status code
    if (response.statusCode == 201) {
      // Do something on success
    } else {
      // Do something on error
    }
  }

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
    var data = await Api().post(
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
    print(" Addin Club in AddClub Sevices File >>>>> $data");
    return data;
  }
}
