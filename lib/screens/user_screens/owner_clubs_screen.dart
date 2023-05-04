import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kick_off/models/ownerClubsModel.dart';
import 'package:provider/provider.dart';

import 'package:kick_off/models/clubModel.dart';
import 'package:kick_off/services/network/user_services/areaService.dart';
import 'package:kick_off/services/network/user_services/get_owner_clubs.dart';
import 'package:kick_off/state_management/clubProvider.dart';

import '../../components/owner_playgrounds.dart';
import '../../models/areaModel.dart';
import '../../state_management/areaProvider.dart';

class OwnerScreen extends StatefulWidget {
  final int adminId;
  OwnerScreen({required this.adminId});
  @override
  State<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    Provider.of<ClubProvider>(context, listen: false)
        .getOwnerClubs(widget.adminId)
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ownerClubsData = Provider.of<ClubProvider>(context);
    final ownerClubs = ownerClubsData.ownerClubs;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Fields",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: ownerClubs.length,
                itemBuilder: (context, index) {
                  return StadiumItem(stadium: ownerClubs[index]);
                },
              ));
  }
}

class StadiumItem extends StatelessWidget {
  final OwnerClubsModel stadium;

  StadiumItem({required this.stadium});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: Image.network(stadium.image),
        title: Text(stadium.name),
        subtitle: Text('${stadium.price}'),
        trailing: Text('${stadium.rate}'),
      ),
    );
  }
}

// Consumer<ClubProvider>(builder: (context, provider, child) {
//         if (provider.ownerClubs.isEmpty) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           // final List<ClubModel> ownerClubs = provider.ownerClubs;

//           return ListView.builder(
//             itemCount: provider.ownerClubs.length,
//             itemBuilder: (context, index) {
//               final ownerClub = provider.ownerClubs[index];

//               int? areaID = ownerClub.areaId;
//               String name = '';
//               final matchingCities = cities.where((city) => city.id == areaID);
//               if (matchingCities.isNotEmpty) {
//                 name = matchingCities.first.name;
//               }
//               return OwnerPlaygrounds(
//                 nameOnwer: ownerClub.name!,
//                 nameArea: name,
//                 price: ownerClub.price!,
//               );
//             },
//           );
//         }
//       }),

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
