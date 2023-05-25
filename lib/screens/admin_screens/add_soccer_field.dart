import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:kick_off/services/api.dart';
import 'package:kick_off/services/network/owner_services/addClubServices.dart';
import 'package:kick_off/state_management/areaProvider.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import '../../models/UserModels/areaModel.dart';
import '../../state_management/ownerProviders/ownerProvidser.dart';

class Service {
  Future<bool> addData(Map<String, String> body, File filepath) async {
    String url = '$baseUrl/club';
    
    Map<String, String> headers = {
      'Authorization': 'Bearer $userToken',
    };
    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath.path));
    var response = await request.send();

    var r = response.stream;
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      print(responseBody);
      print("Status Code is 200 OK ");
      // print(request.fields);
      // print(r);

      buildFlutterToast(
          message: "message IS UPLOADED ", state: ToastStates.SUCCESS);
      return true;
    } else {
      print("Status Code is NOT 200 NOT OK >> ${response.statusCode}");
      buildFlutterToast(
          message: "message IS NOT UPLOADED ", state: ToastStates.ERROR);

      return false;
    }
  }
}

class AddSoccerFieldScreen extends StatefulWidget {
  const AddSoccerFieldScreen({Key? key}) : super(key: key);

  @override
  _AddSoccerFieldScreenState createState() => _AddSoccerFieldScreenState();
}

class _AddSoccerFieldScreenState extends State<AddSoccerFieldScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _priceController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  Service service = Service();

  File? _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  bool _hasWC = false;
  bool _hasCafe = false;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _priceController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  List<AreaModel> areas = [];
  String dropdownValue = 'Option 1';
  List<String> options = ['Option 1',];
  Future<void> getAreas() async {
    await Provider.of<AreaProvider>(context, listen: false).fetchCities();
    areas = Provider.of<AreaProvider>(context, listen: false).cities;
    options=[];
    for (int i = 0; i < areas.length; i++) {
      options.add(areas[i].name);
    }
    dropdownValue=areas[0].name;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAreas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Soccer Field'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/back33.png"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                buildFormFieldText(
                  controller: _nameController,
                  labelText: 'Name',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      
                    });
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                buildFormFieldText(
                  controller: _addressController,
                  labelText: 'Address',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                buildFormFieldText(
                  controller: _priceController,
                  labelText: 'Price',
                  keyboardType: TextInputType.number,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                buildFormFieldText(
                  controller: _phoneController,
                  labelText: 'Phone',
                  keyboardType: TextInputType.phone,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                buildFormFieldText(
                  controller: _notesController,
                  labelText: 'Notes',
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 16.0),
                if (_image != null) ...[
                  Image.file(_image!),
                  const SizedBox(height: 8.0),
                  buildElevatedTextButton(
                      onPressedFunction: () {
                        setState(() {
                          _image = null;
                          // _imageUrl = null;
                        });
                      },
                      titleOfButton: "Clear Image",
                      titleOfButtonColor: Colors.black54,
                      backgroundColor: Color.fromRGBO(255, 202, 204, 1)),
                ] else ...[
                  buildElevatedTextButton(
                      onPressedFunction: () async {
                        // final pickedFile = await ImagePicker()
                        //     .pickImage(source: ImageSource.gallery);
                        // if (pickedFile != null) {
                        //   setState(() {
                        //     _image = File(pickedFile.path);
                        //   });
                        // }
                        getImage();
                      },
                      titleOfButton: "Add Image",
                      titleOfButtonColor: Colors.black54,
                      backgroundColor: Color.fromRGBO(255, 202, 204, 1)),
                ],
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      activeColor: primaryColor,
                      value: _hasWC,
                      onChanged: (value) {
                        setState(() {
                          _hasWC = value!;
                        });
                      },
                    ),
                    const Text('Has WC'),
                    const SizedBox(width: 16.0),
                    Checkbox(
                      activeColor: primaryColor,
                      value: _hasCafe,
                      onChanged: (value) {
                        setState(() {
                          _hasCafe = value!;
                        });
                      },
                    ),
                    const Text('Has Cafe'),
                  ],
                ),
                const SizedBox(height: 32.0),
                buildElevatedTextButton(
                    onPressedFunction: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          _nameController.text;
                          _phoneController.text;
                          _priceController;
                          Map<String, String> body = {
                            "name": _nameController.text,
                            "price": _priceController.text,
                            "phone": _phoneController.text,
                            "address": _addressController.text,
                            "notes": _notesController.text,
                            "area_id": options.indexOf(dropdownValue).toString(),
                            'wc': _hasWC == true ? '1' : '0',
                            'cafe': _hasCafe == true ? '1' : '0',
                          };
                          setState(() {
                            service.addData(body, _image!);
                          });
                        }
                      } catch (e) {
                        print("Error in Add Club in UI  $e");
                        buildFlutterToast(
                            message: "$e", state: ToastStates.ERROR);
                      }
                    },
                    titleOfButton: "Submit",
                    // titleOfButtonColor: Colors.black54,
                    backgroundColor: primaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
