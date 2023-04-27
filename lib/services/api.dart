import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:http/http.dart' ;

class Api {
  // This Method GET data from Api and Decode the source
  //and put it in Map<String ,dynamic> data  , return data
  Future<dynamic> get({required String apiUrl, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': '$token'});
    }
    print("Enter to GET METHOD API");
    http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );
    print("Finish GET METHOD API");
    print(
        "Check response statusCode if is 200 ? return data else throw Exception ");

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print("Respone ===== 200");
      print("Data : $data");
      return data;
    } else {
      return throw Exception(
        "There is PROBLEM in Status Code in GET Method is =! 200 ====>>>> ${response.statusCode.toString()}",
      );
    }
  }
  // This Method POST data from Api and Decode the source
  //and put it in Map<String ,dynamic> data  , return data

  Future<dynamic> post({
    required String apiUrl,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': '$token'});
    }
    print("Enter to POST METHOD API");
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      body: body,
      headers: headers,
    );
    print("Finish POST METHOD API");
    print(
        "Check response statusCode if is 200 ? return data else throw Exception ");

    if (response.statusCode == 200) {
      print("Respone ===== 200");
      Map<String, dynamic> data = jsonDecode(response.body);
      print("Data : $data");
      return data;
    } else {
      return throw Exception(
          "There is PROBLEM in Status Code in POST Method is =! 200 ====>>>>>${response.statusCode} ");
    }
  }

  Future<dynamic> put({
    required String apiUrl,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print("Api url = $apiUrl \n body= $body \n token = $token");
    http.Response response = await http.put(
      Uri.parse(apiUrl),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print("Data = $data");
      return data;
    } else {
      return throw Exception(
          "There is PROBLEM in Status Code in POST Method is =! 200 ====>>>>> Status Code in PULL Method is= ${response.statusCode}");
    }
  }
}
