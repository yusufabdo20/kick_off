import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kick_off/screens/admin_screens/add_services.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import 'ImagePicker.dart';

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

  var priceController = TextEditingController();

  var mobilePhoneController = TextEditingController();

  List<String> cities = [
    'Cairo',
    'Alex',
  ];
  List<String> areas = [
    'Area1',
    'Area2',
    'Area3',
    'Area4',
  ];

  String? selectedCity = "Cairo";
  String? selectedArea = "Area1";

  @override
  Widget build(BuildContext context) {
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
                // flex: 3,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          buildFormFieldText(
                            // backgroundOfTextFeild: Colors.transparent,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Please enter name";
                              }
                            },
                            controller: nameController,
                            // labelText: "Name",
                            // prefixIcon: Icons.person,
                            keyboardType: TextInputType.text,
                            hintText: "Name",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildDropdownButtonFormField(
                            items: cities,
                            selectValue: selectedCity!,
                            borderColor: primaryColor,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildDropdownButtonFormField(
                            items: areas,
                            selectValue: selectedArea!,
                            borderColor: primaryColor,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Please enter Address";
                              }
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = addressController.text;
                              }
                            },
                            controller: addressController,
                            // labelText: "Address",
                            hintText: "Address in details",
                            // prefixIcon:,
                            keyboardType: TextInputType.streetAddress,
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
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = priceController.text;
                              }
                            },
                            hintText: "Price per hour",
                            controller: priceController,
                            // labelText: "Price",
                            // prefixIcon: Icons.phone_android_outlined,
                            suffix: Icons.attach_money_rounded,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.5),
                                //     spreadRadius: 0,
                                //     blurRadius: 0,
                                //     offset: Offset(
                                //         0, 0), // changes position of shadow
                                //   ),
                                // ],
                                ),
                            child: buildElevatedTextButton(
                                titleOfButton: "Add image of soccer field",
                                titleOfButtonColor: Colors.grey,
                                backgroundColor: Color(0xFFCACC),
                                onPressedFunction: () {
                                  _pickImage(ImageSource.gallery);
                                }),
                          ),
                          Container(
                            width: 200,
                            height: 100,
                            child: _imageFile == null
                                ? Center(child: Text('No image selected.'))
                                : Image.file(_imageFile!),
                          ),
                          buildElevatedTextButton(
                              titleOfButton: "Available Services",
                              titleOfButtonColor: Colors.grey,
                              backgroundColor: Color(0xFFCACC),
                              onPressedFunction: () {
                                navigateTO(context, AddServicesScreen());
                              }),
                          Container(
                            // width: double.infinity,
                            child: buildElevatedTextButton(
                              // onPressedFunction: () async {
                              //   try {
                              //     if (formKey.currentState!.validate()) {
                              //       emailController.text;
                              //       passwordController.text;
                              //       var userDataSignUp = await SignUpService()
                              //           .register(
                              //               email: emailController.text,
                              //               password: passwordController.text,
                              //               name: usernameController.text,
                              //               phone: mobilePhoneController.text,
                              //               roll_id: selectedItem == 'Owner'
                              //                   ? "1"
                              //                   : "2" //1 for Owner 2 for user
                              //               );
                              //       print(userDataSignUp);
                              //       if (userDataSignUp['code'] == 201) {
                              //         buildFlutterToast(
                              //             message:
                              //                 "Thank you for your Registration",
                              //             state: ToastStates.SUCCESS);
                              //       Cash.saveData(
                              //         key: 'token',
                              //         value: userDataSignUp['data']['token'],
                              //       ).then((value) {
                              //         navigateTOAndReplacement(
                              //             context, PreferredDataScreen());
                              //       });
                              //       } else {
                              //         buildFlutterToast(
                              //             message:
                              //                 "${userDataSignUp['data']['password']}",
                              //             state: ToastStates.ERROR);
                              //       }
                              //       print(userDataSignUp.toString());
                              //     }
                              //   } catch (e) {
                              //     print("Error in Register Method ++>> $e");
                              //   }
                              // },
                              backgroundColor: Color(0x46D876),
                              titleOfButton: "Upload",
                            ),
                          ),
                          const SizedBox(height: 10),
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

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
