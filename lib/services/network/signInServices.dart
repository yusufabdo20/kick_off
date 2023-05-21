import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../components/constants.dart';
import '../../models/UserModels/userModel.dart';
import '../api.dart';

class SignInService {
  Future<Map<String,dynamic>> login(
    String email,
    String password,
  ) async {
    final url = '$baseUrl/login';
    Map<String, dynamic> data = await Api().post(
      apiUrl: url,
      body: {
        'email': email,
        'password': password,
      },
    token:  "Bearer $userToken",
    );
    print("Login Method ---- DONE");
    print(data);
    return data ;
  }
}
