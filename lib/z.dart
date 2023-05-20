// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:mime_type/mime_type.dart';
// class Product {
//   final String name;
//   final String address;
//   final String phone;
//   final double price;
//   final String image;

//   Product({required this.name, required this.address, required this.phone, required this.price, required this.image});
// }
// class ProductForm extends StatefulWidget {
//   @override
//   _ProductFormState createState() => _ProductFormState();
// }

// class _ProductFormState extends State<ProductForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  final ImagePicker _imagePicker = ImagePicker();
//   late XFile? _pickedImage;

//   // Rest of the code

//   void _pickImage() async {
//     final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _pickedImage = pickedImage;
//     });
//   }
//   String _name = '';
//   String _address = '';
//   String _phone = '';
//   double _price = 0.0;
//   String _image = '';

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // If the form is valid, create a Product instance and post it to the API
//       final product = Product(name: _name, address: _address, phone: _phone, price: _price, image: _image);
//       postProductData(product);
//     }
//   }
// Future<void> postProductData(Product product) async {
//   final url = 'https://example.com/api/products'; // Replace with your API endpoint

//   final headers = {'Content-Type': 'application/json'};
//   final body = jsonEncode({
//     'name': product.name,
//     'address': product.address,
//     'phone': product.phone,
//     'price': product.price,
//     'image': product.image,
//   });

//   try {
//     final response = await http..post(Uri.parse(url), headers: headers, body: body);

//     if (response.statusCode == 200) {
//       // Successful API request
//       print('Product posted successfully');
//       // Add any further actions you want to perform on success
//     } else {
//       // API request failed
//       print('Failed to post product: ${response.statusCode}');
//       // Handle the error or show an appropriate message to the user
//     }
//   } catch (error) {
//     // Exception occurred during the API request
//     print('Error posting product: $error');
//     // Handle the error or show an appropriate message to the user
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Product Form')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//   key: _formKey,
//   child: Column(
//     children: [
//       TextFormField(
//         decoration: InputDecoration(labelText: 'Name'),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please enter a name';
//           }
//           return null;
//         },
//         onSaved: (value) {
//           _name = value!;
//         },
//       ),
//       TextFormField(
//         decoration: InputDecoration(labelText: 'Address'),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please enter an address';
//           }
//           return null;
//         },
//         onSaved: (value) {
//           _address = value!;
//         },
//       ),
//       TextFormField(
//         decoration: InputDecoration(labelText: 'Phone'),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please enter a phone number';
//           }
//           return null;
//         },
//         onSaved: (value) {
//           _phone = value!;
//         },
//       ),
//       TextFormField(
//         decoration: InputDecoration(labelText: 'Price'),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please enter a price';
//           }
//           return null;
//         },
//         keyboardType: TextInputType.number,
//         onSaved: (value) {
//           _price = double.parse(value!);
//         },
//       ),
//       _pickedImage != null
//                   ? Image.file(File(_pickedImage!.path))
//                   : Placeholder(fallbackHeight: 200),

//           ElevatedButton(
//                 child: Text('Pick Image'),
//                 onPressed: _pickImage,
//               ),
//       ElevatedButton(
//         child: Text('Post to API'),
//         onPressed: _submitForm,
//       ),
//     ],
//   ),
// ),

//       ),
//     );
//   }
// }