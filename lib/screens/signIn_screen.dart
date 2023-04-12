import 'package:flutter/material.dart';
import 'package:kick_off/screens/admin_screens/admin_pannel.dart';

import '../components/components.dart';
import '../components/constants.dart';
import '../services/local/cash.dart';
import '../services/network/signInServices.dart';
import 'user_screens/home_screen.dart';

// import 'package:hexcolor/hexcolor.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});
  static String id = 'sign in screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: rgbBahgaPurple1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: primaryColor),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Card.png"),
                  const SizedBox(height: 50),
                  buildHeadLine1Text(
                    text: "Sign In",
                  ),
                  const SizedBox(
                    height: 20,
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
                    labelText: "Email",
                    hintText: "email123@kickoff.com",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildFormFieldText(
                      hintText: "* * * * * * * *",
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
                      labelText: "Password",
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      isSecure: isPassword,
                      suffix:
                          isPassword ? Icons.visibility_off : Icons.visibility,
                      suffixPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      }),
                  Container(
                    width: double.infinity,
                    child: buildElevatedTextButton(
                        onPressedFunction: () async {
                          // try {
                          if (formKey.currentState!.validate()) {
                            emailController.text;
                            passwordController.text;
                            print("Validate Checked ");
                            final userDataSignIn = await SignInService().login(
                              emailController.text,
                              passwordController.text,
                            );
                            print(emailController.text);
                            print(passwordController.text);
                            if (userDataSignIn['code'] == 201) {
                              if (userDataSignIn['data']['roll_id'] == 1) {
                                navigateTO(context, AdminHomeScreen());
                              } else {
                                navigateTO(context, HomeScreen());
                              }
                              buildFlutterToast(
                                  message: "Thank you for your Registration",
                                  state: ToastStates.SUCCESS);
                              _saveToken(userDataSignIn['data']['token'])
                                  .then((value) {
                                navigateTOAndReplacement(context, HomeScreen());
                              });
                            } else {
                              buildFlutterToast(
                                  message:
                                      "${userDataSignIn['data']['password']}",
                                  state: ToastStates.ERROR);
                            }
                            print(userDataSignIn.toString());
                          }
                          // } catch (e) {
                          //   print("Error in LOGIN Method ++>> $e");
                          // }
                        },
                        titleOfButton: "Sign in"),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _saveToken(tokenValue) {
    Cash.saveData(
      key: 'userToken',
      value: tokenValue,
    );
  }
}
