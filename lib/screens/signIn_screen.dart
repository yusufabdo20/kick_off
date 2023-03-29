import 'package:flutter/material.dart';

import '../components/components.dart';
import '../components/constants.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  hintText: "Enter new email address",
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
                    suffix: isPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
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
                        //   if (formKey.currentState!.validate()) {
                        //     email:
                        //     emailController.text;
                        //     password:
                        //     passwordController.text;
                        //     var userDataSignUp =
                        //         await SignUpService().register(
                        //       email: emailController.text,
                        //       password: passwordController2.text,
                        //       name: usernameController.text,
                        //       mobile: mobilePhoneController.text,
                        //       birthDate: birthDateController.text,
                        //     );
                        //     if (userDataSignUp['code'] == 201) {
                        //       buildFlutterToast(
                        //           message:
                        //               "Thank you for your Registration",
                        //           state: ToastStates.SUCCESS);
                        //       Cash.saveData(
                        //         key: 'token',
                        //         value: userDataSignUp['data']['token'],
                        //       ).then((value) {
                        //         navigateTOAndReplacement(
                        //             context, PreferredDataScreen());
                        //       });
                        //     } else {
                        //       buildFlutterToast(
                        //           message:
                        //               "${userDataSignUp['data']['password']}",
                        //           state: ToastStates.ERROR);
                        //     }
                        //     print(userDataSignUp.toString());
                        //   }
                        // } catch (e) {
                        //   print("rror in Register Method ++>> $e");
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
    );
  }
}
