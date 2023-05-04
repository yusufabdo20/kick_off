import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/services/network/user_services/get_all_clubs_for_home_sevice.dart';
import 'package:kick_off/services/network/user_services/get_owner_clubs.dart';
import 'package:kick_off/services/network/user_services/git_specific_club_services.dart';
import 'package:provider/provider.dart';

import '../models/areaModel.dart';
import '../models/clubModel.dart';
import '../models/ownerClubsModel.dart';
import '../services/api.dart';
import 'package:http/http.dart' as http;

class ClubProvider extends ChangeNotifier {
  List<ClubModel> _allClubs = [];
  List<ClubModel> get allClubs => [..._allClubs];
  late ClubModel _specificClub;
  ClubModel get specificClub => _specificClub;
  List<OwnerClubsModel> _ownerClubs = [];
  List<OwnerClubsModel> get ownerClubs => _ownerClubs;
  Future<void> getAllClubsForHome() async {
    final service = GetAllClubsForHome();
    final response = await service.getAllClubsForHome();
    _allClubs = response;
    notifyListeners();
  }

  Future<void> getSpecificClub(int clubID) async {
    _specificClub = await GetSpecificClubService().getSpecificClub(clubID);
    notifyListeners();
  }

  Future<void> getOwnerClubs(adminID) async {
    _ownerClubs = await GetOwnerClubsService().getOwnerClubs(adminID);
    notifyListeners();
  }
}
//   Future<void> fetchClubs(int adminId) async {
//     final url = '$baseUrl/clubs/admin';
//     final response = await http.post(Uri.parse(url), body: {
//       'admin_id': adminId.toString(),
//     }, headers: {
//       "Authorization": 'Bearer $userToken'
//     });
//     final List<dynamic> extractedData = json.decode(response.body)['data'];
//     final List<OwnerClubsModel> loadedStadiums = [];
//     extractedData.forEach((stadiumData) {
//       final stadium = OwnerClubsModel.fromJson(stadiumData);
//       loadedStadiums.add(stadium);
//     });
//     _stadiums = loadedStadiums;
//     notifyListeners();
//   }
// }
// Map<String, String> requestBody = <String,String>{
//      'field1':value1
//   };
//  Map<String, String> headers= <String,String>{
//      'Authorization':'Basic ${base64Encode(utf8.encode('user:password'))}'
//   };

//   var uri = Uri.parse('http://localhost.com');
//   var request = http.MultipartRequest('POST', uri)
//     ..headers.addAll(headers) //if u have headers, basic auth, token bearer... Else remove line
//     ..fields.addAll(requestBody);
//   var response = await request.send();
//   final respStr = await response.stream.bytesToString();
//   return jsonDecode(respStr);
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//    @override
//   void initState() {
//     super.initState();
//     context.read<AreaProvider>().fetchCities();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cities'),
//       ),
//       body: Consumer<AreaProvider>(
//         builder: (context, provider, child) {
//           if (provider.cities.isEmpty) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: provider.cities.length,
//               itemBuilder: (context, index) {
//                 final city = provider.cities[index];
//                 return ListTile(
//                   title: Text(city.name),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }