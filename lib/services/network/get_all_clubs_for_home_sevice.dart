
// class GetAreaService {
//   Future<List<Area>> getAllArea() async {
//     final url = 'http://127.0.0.1:8000/api/area';

//     Map<String, dynamic> data = await Api().get(
//       apiUrl: url,
//     ); // NOTE :: in UI will use FutureBuilder 
//     List<Area> areaList = [];
//     for (int i = 0; i < data['data'].length; i++) {
//       areaList.add(Area.fromJson(data['data'][i]));
//     }
//     return areaList;
//   }
// }
