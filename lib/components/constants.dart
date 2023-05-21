import 'package:flutter/material.dart';
import '../screens/signIn_screen.dart';
import '../services/local/cash.dart';
import 'components.dart';

String adminName = '';
String? userToken ;
// bool isOwner= false ;
// const baseUrl = 'http://161.35.97.26/api';
const baseUrl = 'http://10.0.2.2:8000/api';
const primaryColor = Color.fromRGBO(6, 41, 70, 1);
var primary = Colors.transparent;
var logoImage = "asset s/images/logo.jpeg";
// String? baseUrl= ;
List patterns = [
  {'phonePattern': r'^(?:[0]1)?[0-9]{11}$'},
  {
    'emailPattern':
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  },
  {'passwordPattern': r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'}
];
void signOut(context) {
  Cash.removeData(key: 'token').then((value) {
    navigateTOAndReplacement(context, SignInScreen());
  });
}
