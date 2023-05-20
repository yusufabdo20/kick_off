import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kick_off/models/UserModels/areaModel.dart';
import 'package:kick_off/services/network/owner_services/addClubServices.dart';
import 'package:kick_off/state_management/areaProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../components/components.dart';
import '../../components/constants.dart';

class AddSoccerFieldScreen extends StatefulWidget {
  AddSoccerFieldScreen({super.key});

  @override
  State<AddSoccerFieldScreen> createState() => _AddSoccerFieldScreenState();
}

final ImagePicker _picker = ImagePicker();
File? _imageFile;

class _AddSoccerFieldScreenState extends State<AddSoccerFieldScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var addressController = TextEditingController();
  var notesController = TextEditingController();

  var priceController = TextEditingController();

  var mobilePhoneController = TextEditingController();
  File? _imageFile;
  String? _imageUrl;
  bool wc = false, cafe = false;
  Future<void> _uploadImage(File image) async {
    final url = Uri.parse('$baseUrl/club');
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      setState(() {
        _imageUrl = responseString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<AreaModel> areas = Provider.of<AreaProvider>(context).cities;
    //   List<String> cities = [
    //   'Cairo',
    //   'Alex',
    // ];
    // List<String> areas = areas

    // String? selectedCity = "Cairo";
    // String selectedArea = areas[0].toString();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: rgbBahgaPurple1,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/back33.png"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          buildFormFieldText(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            hintText: "Name",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                            controller: addressController,
                            hintText: "Address in details",
                            keyboardType: TextInputType.streetAddress,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                            controller: notesController,
                            hintText: "Add notes",
                            keyboardType: TextInputType.multiline,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                            hintText: "Phone",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a valid mobile phone ';
                              }
                              return null;
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = mobilePhoneController.text;
                              }
                            },
                            controller: mobilePhoneController,
                            // labelText: "Mobile Phone",
                            // prefixIcon: Icons.phone_android_outlined,
                            suffix: Icons.phone_enabled_outlined,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildFormFieldText(
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a Price';
                              }
                              return null;
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = priceController.text;
                              }
                            },
                            hintText: "Price per hour",
                            controller: priceController,
                            suffix: Icons.attach_money_rounded,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          if (_imageFile != null) ...[
                            Image.file(_imageFile!),
                            Container(
                              width: double.infinity,
                              child: buildElevatedTextButton(
                                titleOfButton: "Clear",
                                onPressedFunction: () {
                                  setState(() {
                                    _imageFile = null;
                                    _imageUrl = "";
                                  });
                                },
                              ),
                            )
                          ] else ...[
                            Container(
                              width: double.infinity,
                              child: buildElevatedTextButton(
                                titleOfButton: "Add image of soccer field",
                                titleOfButtonColor: Colors.grey,
                                backgroundColor: Color(0xFFCACC),
                                onPressedFunction: () async {
                                  final pickedFile =
                                      await ImagePicker().pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  setState(() {
                                    _imageFile = File(pickedFile!.path);
                                  });
                                },
                              ),
                            ),
                          ],
                          if (_imageUrl != null) Text(_imageUrl!),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildElevatedTextButton(
                                titleOfButton: 'WC',
                                onPressedFunction: () {
                                  setState(() {
                                    wc = !wc;
                                  });
                                },
                                backgroundColor:
                                    wc == false ? Colors.grey : primaryColor,
                              ),
                              buildElevatedTextButton(
                                titleOfButton: 'Cafe',
                                onPressedFunction: () {
                                  setState(() {
                                    cafe = !cafe;
                                  });
                                },
                                backgroundColor:
                                    cafe == false ? Colors.grey : primaryColor,
                              ),
                            ],
                          ),
                          buildElevatedTextButton(
                              titleOfButton: "Submit",
                              // titleOfButtonColor: Colors.grey,
                              // backgroundColor: Color(0xFFCACC),
                              onPressedFunction: () async {
                                try {
                                  print(_imageFile!.uri);

                                  if (formKey.currentState!.validate()) {
                                    nameController.text;
                                    addressController;
                                    mobilePhoneController;
                                    priceController;
                                    var clubAdded =
                                        await AddClubServices().addClub(
                                      name: nameController.text,
                                      address: addressController.text,
                                      phone: mobilePhoneController.text,
                                      price: priceController.text,
                                      image: _imageFile!,
                                      wc: wc == false ? '0' : '1',
                                      cafe: cafe == false ? '0' : '1',
                                    );

                                    // _uploadImage(_imageFile!);

                                    print(clubAdded);
                                    if (clubAdded['status'] == "success") {
                                      buildFlutterToast(
                                        message: "Playground Uplaoded",
                                        state: ToastStates.SUCCESS,
                                      );
                                    }
                                  }
                                } catch (e) {
                                  print(
                                      'Error in Add Club>>>> ' + e.toString());
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
