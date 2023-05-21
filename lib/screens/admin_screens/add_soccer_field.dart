
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../components/components.dart';
import '../../components/constants.dart';

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

  File? _imageFile;
  String? _imageUrl;

  bool _hasWC = false;
  bool _hasCafe = false;

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

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('$baseUrl/club');
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = 'Bearer $userToken';
      request.fields['name'] = _nameController.text;
      request.fields['address'] = _addressController.text;
      request.fields['price'] = _priceController.text;
      request.fields['phone'] = _phoneController.text;
      request.fields['notes'] = _notesController.text;
      request.fields['wc'] = _hasWC == false ? "0" : "1";
      request.fields['cafe'] = _hasCafe == false ? "0" : "1";

      if (_imageFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          _imageFile!.path,
        ));
      }

      final response = await request.send();
      print(request.fields);
      print(response.headers);
      if (response.statusCode == 200) {
        print(
            'RESPONSE STATUS CODE IS 200 ...... ${response.statusCode.toString()}');
      } else {
        print(
            'RESPONSE STATUS CODE IS NOT !!!!!!!!200 ...... ${response.statusCode.toString()}');
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _priceController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
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
                if (_imageFile != null) ...[
                  Image.file(_imageFile!),
                  const SizedBox(height: 8.0),
                  buildElevatedTextButton(
                      onPressedFunction: () {
                        setState(() {
                          _imageFile = null;
                          _imageUrl = null;
                        });
                      },
                      titleOfButton: "Clear Image",
                      titleOfButtonColor: Colors.black54,
                      backgroundColor: Color.fromRGBO(255, 202, 204, 1)),
                ] else ...[
                  buildElevatedTextButton(
                      onPressedFunction: () async {
                        final pickedFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          setState(() {
                            _imageFile = File(pickedFile.path);
                          });
                        }
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
                    onPressedFunction: _submitForm,
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
