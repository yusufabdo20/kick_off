// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import '../../models/areaModel.dart';
// import '../api.dart';

// class GetAllClubsForHome
//  {
//   Future<List<Area>> getAllArea() async {
//     const url = 'http://19.168.1.13/api/area';

//     Map<String, dynamic> data = await Api().get(
//       apiUrl: url,
//     );
//     // NOTE :: in UI will use FutureBuilder 
//     List<Area> areaList = [];
//     for (int i = 0; i < data['data'].length; i++) {
//       areaList.add(Area.fromJson(data['data'][i]));
//     }
//     return areaList;
//   }
// }