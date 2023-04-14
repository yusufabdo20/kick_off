import 'package:flutter/material.dart';
import 'package:kick_off/screens/user_screens/home.dart';

import '../components/components.dart';
import '../components/constants.dart';
import '../services/network/signUpServices.dart';
import 'admin_screens/admin_pannel.dart';
import 'signIn_screen.dart';

// import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static String id = 'sign up screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var mobilePhoneController = TextEditingController();
  // var birthDateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isPassword2 = true;

  late var checkPasswordCorrect;
  List<String> items = [
    'Owner',
    'User',
  ];
  String? selectedItem = "Owner";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: rgbBahgaPurple1,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(20.0),
                          //   child: Image.asset(
                          //     "assets/images/Card.png",
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          const SizedBox(height: 20),
                          buildHeadLine1Text(
                            text: "Sign Up",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildFormFieldText(
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter username";
                              }
                            },
                            controller: usernameController,
                            // labelText: "Username",
                            prefixIcon: Icons.person,
                            keyboardType: TextInputType.text,
                            hintText: "Name",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter email";
                              }

                              if (!RegExp(patterns[1]['emailPattern'])
                                  .hasMatch(value)) {
                                return "Please Enter a valid email address.";
                              }
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = emailController.text;
                              }
                            },
                            onChange: (value) {
                              if (formKey.currentState!.validate()) {
                                value = emailController.text;
                              }
                            },
                            controller: emailController,
                            // labelText: "Email",
                            hintText: "Email",
                            prefixIcon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                            hintText: "Mobile phone",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a valid mobile phone ';
                              }
                              if (!RegExp(patterns[0]['phonePattern'])
                                  .hasMatch(value)) {
                                return 'please enter a valid 11 numbers of your phone \n and Start with 01xxxxxxxxx';
                              }
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = mobilePhoneController.text;
                              }
                            },
                            onChange: (value) {
                              if (formKey.currentState!.validate()) {
                                value = mobilePhoneController.text;
                              }
                            },
                            controller: mobilePhoneController,
                            // labelText: "Mobile Phone",
                            prefixIcon: Icons.phone_android_outlined,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                              hintText: "Password",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter a valid password ';
                                }
                              },
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  value = passwordController.text;
                                }
                              },
                              controller: passwordController,
                              // labelText: "Password",
                              prefixIcon: Icons.lock,
                              keyboardType: TextInputType.visiblePassword,
                              isSecure: isPassword,
                              suffix: isPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              suffixPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          // Text("Who are you ?"),
                          buildDropdownButtonFormField(
                            items: items,
                            selectValue: selectedItem!,
                            borderColor: primaryColor,
                          ),
                          Container(
                            width: double.infinity,
                            child: buildElevatedTextButton(
                                onPressedFunction: () async {
                                  navigateTO(context, Home());
                                  try {
                                    if (formKey.currentState!.validate()) {
                                      emailController.text;
                                      passwordController.text;
                                      var userDataSignUp = await SignUpService()
                                          .register(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: usernameController.text,
                                              phone: mobilePhoneController.text,
                                              roll_id: selectedItem == 'Owner'
                                                  ? "1"
                                                  : "2" //1 for Owner 2 for user
                                              );
                                      print(userDataSignUp);
                                      if (userDataSignUp['code'] == 201) {
                                        buildFlutterToast(
                                            message:
                                                "Thank you for your Registration",
                                            state: ToastStates.SUCCESS);
                                        //       Cash.saveData(
                                        //         key: 'token',
                                        //         value: userDataSignUp['data']['token'],
                                        //       ).then((value) {
                                        //         navigateTOAndReplacement(
                                        //             context, PreferredDataScreen());
                                        //       });

                                      } else {
                                        buildFlutterToast(
                                            message:
                                                "${userDataSignUp['data']['password']}",
                                            state: ToastStates.ERROR);
                                      }
                                      print(userDataSignUp.toString());
                                    }
                             
                                  } catch (e) {
                                    print("Error in Register Method ++>> $e");
                                  }
                                },
                                titleOfButton: "Register"),
                          ),
                          const SizedBox(height: 10),
                           TextButton(onPressed: () {

                    navigateTOAndReplacement(context,SignInScreen(),);
                  },
                  child: Text("Have an account ? | Sign in now"),)

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
