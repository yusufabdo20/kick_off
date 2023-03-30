import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/personModel.dart';
import '../api.dart';

class SignInService {
  Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final url = 'http://127.0.0.1:8000/api/login';

    Map<String, dynamic> data = await Api().post(
      apiUrl: url,   
      body: {
        'email': email,
        'password': password,
      

      },
      // token: token
    );
    return data;
  }

  // Future<http.Response> loginToApp(String email, String password) async {
  //   http.Response response = await http.post(
  //     Uri.parse('http://127.0.0.1:8000/api/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'email': email,
  //       'password': password,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     final User user = User.fromJson({
  //       'id': data['data']['userData']['id'],
  //       'name': data['data']['userData']['name'],
  //       'email': data['data']['userData']['email'],
  //       'roll_id': data['data']['userData']['roll_id'],
  //       'token': data['data']['token'],
  //     });
  //     return user;
  //   } else {
  //     print('Failed to login. Error: ${response.body}');
  //     return throw Exception(
  //         "There is PROBLEM in Status Code in POST Method is =! 200 ====>>>>>${response.statusCode}");
  //   }
  // }
}
