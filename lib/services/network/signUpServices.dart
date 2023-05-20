

import '../../components/constants.dart';
import '../api.dart';

class SignUpService {

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required  String roll_id,
  }) async {
    // final url = 'http://197.60.240.5/api/register/';
    final url = '$baseUrl/register';
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
