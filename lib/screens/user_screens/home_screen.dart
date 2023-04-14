import 'package:flutter/material.dart';
import 'package:kick_off/components/home_component/Search_field.dart';
import 'package:kick_off/components/home_component/areas_categories.dart';
import 'package:kick_off/components/home_component/playgrounds_categories.dart';
import 'package:kick_off/models/areaModel.dart';
import 'package:kick_off/services/network/areaService.dart';
import 'package:kick_off/services/network/get_all_clubs_for_home_sevice.dart';
import 'package:kick_off/state_management/areaProvider.dart';
import 'package:provider/provider.dart';
import '../../components/components.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Area> areasModel = [];

  @override
  Widget build(BuildContext context) {
    areasModel = Provider.of<AreaProvider>(context).areas;

// [
//         {
//             "id": 1,
//             "name": "Maadi",
//             "created_at": "2023-03-27T21:51:18.000000Z",
//             "updated_at": "2023-03-27T21:51:18.000000Z"
//         },
//         {
//             "id": 2,
//             "name": "Cairo",
//             "created_at": "2023-03-27T21:51:18.000000Z",
//             "updated_at": "2023-03-27T21:51:18.000000Z"
//         },
//         {
//             "id": 3,
//             "name": "Giza",
//             "created_at": "2023-03-27T21:51:18.000000Z",
//             "updated_at": "2023-03-27T21:51:18.000000Z"
//         }
//     ]
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              navigateTO(context, NotificationsScreen());
            },
            icon: Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: Color(0xff3A3A3A),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const SearchTextField(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Area",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Select all",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FutureBuilder(
                          future: GetAreaService().getAllArea(),
                          builder: (context, snapshot) {
                            final areasList = snapshot.data;

                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final area = areasList![index];
                                  return AreasCategories(
                                    name: "${area.name}",
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Center(child: Text('${snapshot.error}'));
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nearest Soccer fields",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    // textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: GetAllClubsForHome().getAllClubsForHome(),
                    builder: (context, snapshot) {
                      final clubsList = snapshot.data;

                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final club = clubsList![index];
                            int? areaID = clubsList[index].areaId;
                            return PlaygroundsCategories(
                              nameOnwer: "${club.name}",
                              nameArea: "${areasModel[areaID!].name}",
                              image: "${club.image}",
                              rate: "${club.rate}",
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('${snapshot.error}'));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
