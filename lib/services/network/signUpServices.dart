import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api.dart';

class SignUpService {
  get baseUrl => null;

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String roll_id,
  }) async {
    // final url = 'http://197.60.240.5/api/register/';
    final url = 'http://192.168.1.8:8000/api/register';
    print(url);
    Map<String, dynamic> data = await Api().post(
      apiUrl: url,
      body: {
        'email': email,
        'password': password,
        "name": name,
        "phone": phone,
        "roll_id": roll_id
      },
    );
    print(data);
    return data;
  }
}
