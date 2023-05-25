import 'dart:convert';

import '../../../components/constants.dart';
import '../../../models/UserModels/ownerClubsModel.dart';
import '../../api.dart';
import '../../local/cash.dart';

class GetOwnerClubsService {
  Future<List<OwnerClubsModel>> getOwnerClubs(String adminId) async {
    final url = '$baseUrl/clubs/admin';
    var tookeen = Cash.getData(key: "userToken").toString();
    print(tookeen);
    print(adminId) ;
    // String admin_id = "1";
    Map<String, dynamic> data = await Api().post(
      body: {
        'admin_id': adminId,
      },
      apiUrl: url,
      token: "Bearer $userToken",
    );
    List<OwnerClubsModel> clubsList = [];
    for (int i = data['data'].length - 1; i >= 0; i--) {
      clubsList.add(OwnerClubsModel.fromJson(data['data'][i]));
      print('----------------------------------------------');
      print(data['data'][i]);
    }
    print('object in API ');
    print(userToken);

    return clubsList;
  }
}
