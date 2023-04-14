import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kick_off/models/clubModel.dart';
import 'package:kick_off/services/network/areaService.dart';
import 'package:kick_off/services/network/get_owner_clubs.dart';

import '../../components/owner_playgrounds.dart';
import '../../models/areaModel.dart';

class OwnerScreen extends StatelessWidget {
  const OwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "El-Salam fields",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<ClubModel>>(
          future: GetOwnerClubs().getOwnerClubs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final ownerClubs = snapshot.data!;
              return ListView.builder(
                itemCount: ownerClubs.length,
                itemBuilder: (context, index) {
                  final ownerClub = ownerClubs[index];
                  // var areasList = GetAreaService().getAllArea();  
                  // var areaName =
                  //     areasList.where((area) => area['id'] == 2).toList();
                  return OwnerPlaygrounds(
                    nameOnwer: "${ownerClub.name}",
                    nameArea: "S",
                    price: ownerClub.price!,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
//  SingleChildScrollView(
//               child: Column(
//                 children: [
//                   OwnerPlaygrounds(
//                     nameOnwer: 'El-Turky fileld ',
//                     nameArea: "Giza",
//                     price: 180,
//                   ),
//                   OwnerPlaygrounds(
//                     nameOnwer: 'El-Salam fileld ',
//                     nameArea: "Cairo",
//                     price: 150,
//                   ),
//                 ],
//               ),
//             );