import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../components/constants.dart';
import '../../api.dart';

class AddClubServices {
  Future<bool> addImage(Map<String, String> body, String filepath) async {
    String addimageUrl = '<domain-name>/api/imageadd';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
  Future<Map<String, dynamic>> addClub({
    required String name,
    required String price,
    required String phone,
    required File imageFile,
    required int area_Id,
    String? address,
    String? notes,
    bool? wc,
    bool? cafe,
  }) async {
    final url = '$baseUrl/club';
    print(url);
    Map<String, dynamic> data = await Api().post(
        apiUrl: url,
        body: {
          "name": name,
          "phone": phone,
          "price": price,
          'area_id': area_Id.toString(),
          "address": address ?? "No Address",
          "notes": notes ?? "No Notes",
          "wc": wc == true ? '1' : '0',
          "cafe": cafe == true ? '1' : '0'
        },
        token: 'Bearer $userToken');
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile!.path));
    print(data);
    return data;
  }
}
