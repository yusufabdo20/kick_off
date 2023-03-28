import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api.dart';
class SignInService {
Future<Map<String, dynamic>> login(String email, String password ,) async {
  final apiPassword = 'Bahga2023';
  final url = 'http://170.64.178.132:30465/api/login';

  Map<String, dynamic> data = await Api().post(
    apiUrl: url,
    body: {
      'apiPassword': apiPassword,
      'email': email,
      'password': password,
    },
    // token: token
  );
  return data;
}


}

