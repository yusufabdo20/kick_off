import 'package:flutter/material.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/components/home_component/Search_field.dart';
import 'package:kick_off/components/home_component/areas_categories.dart';
import 'package:kick_off/components/home_component/playgrounds_categories.dart';
import 'package:kick_off/models/UserModels/areaModel.dart';
import 'package:kick_off/services/network/user_services/areaService.dart';
import 'package:kick_off/services/network/user_services/get_all_clubs_for_home_sevice.dart';
import 'package:kick_off/state_management/areaProvider.dart';
import 'package:kick_off/state_management/clubProvider.dart';
import 'package:provider/provider.dart';
import '../../components/components.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AreaModel> cities = [];

  @override
  void initState() {
    super.initState();
    context.read<AreaProvider>().fetchCities();
    context.read<ClubProvider>().getAllClubsForHome();
    // context.read<ClubProvider>().getOwnerClubs(adminId);
  }

  @override
  Widget build(BuildContext context) {
    // final areaProvider = Provider.of<AreaProvider>(context);
    // final clubProvider = Provider.of<ClubProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              navigateTO(context, const NotificationsScreen());
            },
            icon: const Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: Color(0xff3A3A3A),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SearchTextField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Area",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Select all",
                          style: TextStyle(fontSize: 16, color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  Consumer<AreaProvider>(
                    builder: (context, provider, child) {
                      cities = provider.cities;
                      if (provider.cities.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SizedBox(
                          height: 35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.cities.length,
                            itemBuilder: (context, index) {
                              final city = provider.cities[index];
                              return AreasCategories(
                                name: city.name,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Nearest Soccer fields",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    // textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<ClubProvider>(
                    builder: (context, provider, child) {
                      if (provider.allClubs.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: provider.allClubs.length,
                            itemBuilder: (context, index) {
                              final club = provider.allClubs[index];
                              // provider.getOwnerClubs(club.adminId);
                             
                              int? areaID = club.areaId;
                              String name = '';
                              final matchingCities =
                                  cities.where((city) => city.id == areaID);
                              if (matchingCities.isNotEmpty) {
                                name = matchingCities.first.name;
                              }
                              return HomePlaygroundsCategories(
                                nameOnwer: "${club.name}",
                                nameArea: name,
                                image: "${club.image}",
                                rate: "${club.rate}",
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
