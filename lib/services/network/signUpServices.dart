import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api.dart';

class SignUpService {
  Future<Map<String, dynamic>> register(
      {required String name,
      required String email,
      required String password,
      required String mobile,
      required String birthDate}) async {
    final apiPassword = 'Bahga2023';
    final url = 'http://170.64.178.132:30465/api/register/';

    Map<String, dynamic> data = await Api().post(
      apiUrl: url,
      body: {
        'apiPassword': apiPassword,
        'email': email,
        'password': password,
        "name": name,
        "mobile": mobile,
        "bdate": birthDate,
      },
    );
    return data;
  }
}
