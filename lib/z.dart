// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:kick_off/components/constants.dart';
// import 'package:provider/provider.dart';

// class Stadium {
//   int id;
//   int price;
//   String name;
//   int wc;
//   int cafe;
//   String creationDate;
//   String image;
//   int adminId;
//   int areaId;
//   int rate;

//   Stadium({
//     required this.id,
//     required this.price,
//     required this.name,
//     required this.wc,
//     required this.cafe,
//     required this.creationDate,
//     required this.image,
//     required this.adminId,
//     required this.areaId,
//     required this.rate,
//   });
// }

// class StadiumProvider with ChangeNotifier {
//   List<Stadium> _stadiums = [];

//   List<Stadium> get stadiums => _stadiums;

//   Future<void> fetchStadiumsByAdminId(int adminId) async {
//     try {
//       final response = await Dio().post(
//         '$baseUrl/clubs/admin',
//         data: {'admin_id': adminId},
//         options: Options(headers: {'Authorization':'Bearer $userToken'})
//       );
//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = response.data['data'];
//         _stadiums = responseData
//             .map(
//               (stadium) => Stadium(
//                 id: stadium['id'],
//                 price: stadium['price'],
//                 name: stadium['name'],
//                 wc: stadium['wc'],
//                 cafe: stadium['cafe'],
//                 creationDate: stadium['creationDate'],
//                 image: stadium['image'],
//                 adminId: stadium['admin_id'],
//                 areaId: stadium['area_id'],
//                 rate: stadium['rate'],
//               ),
//             )
//             .toList();
//         notifyListeners();
//       }
//     } catch (error) {
//       print(error);
//     }
//   }
// }

// class StadiumScreen extends StatefulWidget {
//   final int adminId;

//   StadiumScreen({required this.adminId});

//   @override
//   _StadiumScreenState createState() => _StadiumScreenState();
// }

// class _StadiumScreenState extends State<StadiumScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<StadiumProvider>(context, listen: false)
//         .fetchStadiumsByAdminId(widget.adminId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Stadiums'),
//         ),
//         body: Consumer<StadiumProvider>(
//             builder: (context, stadiumProvider, child) {
//           final stadiums = stadiumProvider.stadiums;
//           return ListView.builder(
//             itemCount: stadiums.length,
//             itemBuilder: (context, index) {
//               final stadium = stadiums[index];
//               return ListTile(
//                 title: Text(stadium.name),
//                 subtitle: Text('Price: ${stadium.price}'),
//                 leading: Image.network(stadium.image),
//                 trailing: Text('Rate: ${stadium.rate}'),
//               );
//             },
//           );
//         }));
//   }
// }
