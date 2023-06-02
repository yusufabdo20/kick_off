import 'package:flutter/material.dart';
import 'package:kick_off/screens/admin_screens/admin_pannel.dart';
import 'package:kick_off/screens/register_screen.dart';
import 'package:kick_off/screens/user_screens/home.dart';
import 'package:kick_off/state_management/ownerProviders/ownerProvidser.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: Colors.white,
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
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back22.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          // reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset("assets/images/Card.png"),
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
                    // labelText: "Email",
                    hintText: "Email",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
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
                          try {
                            if (formKey.currentState!.validate()) {
                              emailController.text;
                              passwordController.text;
                              final data = await SignInService().login(
                                emailController.text,
                                passwordController.text,
                              );

                              var userDataSignIn = data['data']['userData'];

                              print(userDataSignIn);
                              if (data['code'] == 201) {
                                if (userDataSignIn['roll_id'] == 1) {
                                  print(
                                      'Owner >>>>>> ${userDataSignIn['roll_id']}');

                                  Provider.of<OwnerProvider>(context,listen: false)
                                      .getAdminName(userDataSignIn['name']);
                                  Cash.saveData(key: 'isOwner', value: true);

                                  navigateTOAndReplacement(
                                      context, AdminHomeScreen());
                                } else {
                                  print(
                                      'USER >>>>>>>> ${userDataSignIn['roll_id']}');
                                  Cash.saveData(key: 'isOwner', value: false);
                                  navigateTOAndReplacement(context, Home());
                                }
                                Cash.saveData(
                                  key: 'userToken',
                                  value: data['data']['token'],
                                ).then((value) {
                                  print(value);
                                });
                                buildFlutterToast(
                                    message: "Sign in Successfully",
                                    state: ToastStates.SUCCESS);
                              } else {
                                buildFlutterToast(
                                    message:
                                        "${userDataSignIn['data']['data']}",
                                    state: ToastStates.ERROR);
                              }
                            }
                          } catch (e) {
                            print("Error in LOGIN Method ++>> $e");
                          }
                        },
                        titleOfButton: "Sign in"),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      navigateTOAndReplacement(
                        context,
                        SignUpScreen(),
                      );
                    },
                    child: Text("Dont have an account ? | Join us now"),
                  )
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
    ).then((value) {
      print(value);
    });
  }
}


//   void _checkStatusCodeAndUserType(Map<String, dynamic> userDataSignIn) {
//     if (userDataSignIn['code'] == 201) {
//       if (userDataSignIn['data']['roll_id'] == 1) {
//         print("Owner >>>>>>>> OWNER ");
//         navigateTO(context, AdminHomeScreen());
//       } else {
//         print("USER >>>>>>>> USER ");
//         navigateTO(context, const Home());
//       }
//       _saveToken(userDataSignIn['data']['token']);
//       buildFlutterToast(
//           message: "Thank you for your Registration",
//           state: ToastStates.SUCCESS);
//     } else {
//       buildFlutterToast(
//           message: "${userDataSignIn['data']['password']}",
//           state: ToastStates.ERROR);
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:kick_off/screens/admin_screens/admin_pannel.dart';
// import 'package:kick_off/screens/register_screen.dart';
// import 'package:kick_off/screens/user_screens/home.dart';

// import '../components/components.dart';
// import '../components/constants.dart';
// import '../services/network/signInServices.dart';
// import 'user_screens/home_screen.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// class SecureStorage {
//   static final storage = FlutterSecureStorage();

//   static Future<String?> getData({required String key}) async {
//     return await storage.read(key: key);
//   }

//   static Future<void> saveData({
//     required String key,
//     required String value,
//   }) async {
//     return await storage.write(key: key, value: value);
//   }

//   static Future<void> deleteData({required String key}) async {
//     return await storage.delete(key: key);
//   }
// }

// class SignInScreen extends StatefulWidget {
//   SignInScreen({Key? key}) : super(key: key);
//   static String id = 'sign in screen';

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   bool isPassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios),
//             color: primaryColor),
//         elevation: 0,
//       ),
//       body: Container(
//         height: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/back22.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           // reverse: true,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 50),
//                   buildHeadLine1Text(
//                     text: "Sign In",
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   buildFormFieldText(
//                     validate: (value) {
//                       if (value!.isEmpty) {
//                         return "Please Enter email";
//                       }

//                       if (!RegExp(patterns[1]['emailPattern'])
//                           .hasMatch(value)) {
//                         return "Please Enter a valid email address.";
//                       }
//                     },
//                     onSubmit: (_) => _signIn(),
//                     onChange: (_) {},
//                     controller: emailController,
//                     hintText: "Email",
//                     prefixIcon: Icons.email,
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   buildFormFieldText(
//                       hintText: "Password",
//                       validate: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter a valid password ';
//                         }
//                       },
//                       onSubmit: (_) => _signIn(),
//                       controller: passwordController,
//                       prefixIcon: Icons.lock,
//                       keyboardType: TextInputType.visiblePassword,
//                       isSecure: isPassword,
//                       suffix:
//                           isPassword ? Icons.visibility_off : Icons.visibility,
//                       suffixPressed: () {
//                         setState(() {
//                           isPassword = !isPassword;
//                         });
//                       }),
//                   Container(
//                     width: double.infinity,
//                     child: buildElevatedTextButton(
//                         onPressedFunction: _signIn,
//                         titleOfButton: "Sign in"),
//                   ),
//                   const SizedBox(height: 10),
//                   TextButton(
//                     onPressed: () {
//                       navigateTOAndReplacement(
//                         context,
//                         SignUpScreen(),
//                       );
//                     },
//                     child: Text("Dont have an account ? | Join us now"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _signIn() async {
//     if (formKey.currentState!.validate()) {
//       try {
//         final data = await SignInService().login(
//           emailController.text,
//           passwordController.text,
//         );

//         var userDataSignIn = data['data']['userData'];

//         print(userDataSignIn);
//         if (data['code'] == 201) {
// if (userDataSignIn['roll_id'] == 1) {
// print('Owner >>>>>> ${userDataSignIn['roll_id']}');

//         SecureStorage.saveData(key: 'isOwner', value: true);

//         adminName = userDataSignIn['name'];
//         navigateTOAndReplacement(context, AdminHomeScreen());
//       } else {
//         print('USER >>>>>>>> ${userDataSignIn['roll_id']}');
//         SecureStorage.saveData(key: 'isOwner', value: false);
//         navigateTOAndReplacement(context, Home());
//       }

//       SecureStorage.saveData(
//         key: 'userToken',
//         value: data['data']['token'],
//       ).then((value) {
//         print(value);
//       });

//       buildFlutterToast(
//           message: "Sign in Successfully",
//           state: ToastStates.SUCCESS);
//     } else {
//       buildFlutterToast(
//           message: "${userDataSignIn['data']['data']}",
//           state: ToastStates.ERROR);
//     }
//   } catch (e) {
//     print("Error in LOGIN Method ++>> $e");
//     buildFlutterToast(
//         message: "Failed to sign in.",
//         state: ToastStates.ERROR);
//   }
// }
// }
// }

// class SignInService {
// Future<Map<String, dynamic>> login(
// String email,
// String password,
// ) async {
// final url = '$baseUrl/login';
// Map<String, dynamic> data = await Api().post(
// apiUrl: url,
// body: {
// 'email': email,
// 'password': password,
// },
// token: "Bearer ${SecureStorage.getData(key: 'userToken') ?? ''}",
// );

// print("Login Method ---- DONE");
// print(data);
// return data;
// }
// }
// import 'package:flutter/material.dart';
// import 'package:kick_off/screens/admin_screens/admin_pannel.dart';
// import 'package:kick_off/screens/register_screen.dart';
// import 'package:kick_off/screens/user_screens/home.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../components/components.dart';
// import '../components/constants.dart';
// import '../services/api.dart';
// import '../services/network/signInServices.dart';
// import 'user_screens/home_screen.dart';

// class SignInScreen extends StatefulWidget {
//   SignInScreen({super.key});
//   static String id = 'sign in screen';

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();

//   bool isPassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios),
//             color: primaryColor),
//         elevation: 0,
//       ),
//       body: Container(
//         height: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/back22.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           // reverse: true,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 // crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Image.asset("assets/images/Card.png"),
//                   const SizedBox(height: 50),
//                   buildHeadLine1Text(
//                     text: "Sign In",
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   buildFormFieldText(
//                     validate: (value) {
//                       if (value!.isEmpty) {
//                         return "Please Enter email";
//                       }

//                       if (!RegExp(patterns[1]['emailPattern'])
//                           .hasMatch(value)) {
//                         return "Please Enter a valid email address.";
//                       }
//                     },
//                     onSubmit: (value) {
//                       if (formKey.currentState!.validate()) {
//                         value = emailController.text;
//                       }
//                     },
//                     onChange: (value) {
//                       if (formKey.currentState!.validate()) {
//                         value = emailController.text;
//                       }
//                     },
//                     controller: emailController,
//                     // labelText: "Email",
//                     hintText: "Email",
//                     prefixIcon: Icons.email,
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   buildFormFieldText(
//                       hintText: "Password",
//                       validate: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter a valid password ';
//                         }
//                       },
//                       onSubmit: (value) {
//                         if (formKey.currentState!.validate()) {
//                           value = passwordController.text;
//                         }
//                       },
//                       controller: passwordController,
//                       // labelText: "Password",
//                       prefixIcon: Icons.lock,
//                       keyboardType: TextInputType.visiblePassword,
//                       isSecure: isPassword,
//                       suffix:
//                           isPassword ? Icons.visibility_off : Icons.visibility,
//                       suffixPressed: () {
//                         setState(() {
//                           isPassword = !isPassword;
//                         });
//                       }),
//                   Container(
//                     width: double.infinity,
//                     child: buildElevatedTextButton(
//                         onPressedFunction: () async {
//                           try {
//                             if (formKey.currentState!.validate()) {
//                               emailController.text;
//                               passwordController.text;
//                               print("_signInValidator Function ");
//                               final data = await SignInService().login(
//                                 emailController.text,
//                                 passwordController.text,
//                               );

//                               var userDataSignIn = data['data']['userData'];

//                               print(userDataSignIn);
//                               if (data['code'] == 201) {
//                                 if (userDataSignIn['roll_id'] == 1) {
//                                   print(
//                                       'Owner >>>>>> ${userDataSignIn['roll_id']}');

//                                   SharedPreferencesHelper.setIsOwner(true);

//                                   adminName = userDataSignIn['name'];
//                                   navigateTOAndReplacement(
//                                       context, AdminHomeScreen());
//                                 } else {
//                                   print(
//                                       'USER >>>>>>>> ${userDataSignIn['roll_id']}');
//                                   SharedPreferencesHelper.setIsOwner(false);
//                                   navigateTOAndReplacement(context, Home());
//                                 }

//                                 SharedPreferencesHelper.setUserToken(
//                                     data['data']['token']);
//                                 buildFlutterToast(
//                                     message: "Sign in Successfully",
//                                     state: ToastStates.SUCCESS);
//                               } else {
//                                 buildFlutterToast(
//                                     message:
//                                         "${userDataSignIn['data']['data']}",
//                                     state: ToastStates.ERROR);
//                               }
//                             }
//                           } catch (e) {
//                             print("Error in LOGIN Method++>> $e");
//                           }
//                         },
//                         titleOfButton: "Sign in"),
//                   ),
//                   const SizedBox(height: 10),
//                   TextButton(
//                     onPressed: () {
//                       navigateTOAndReplacement(
//                         context,
//                         SignUpScreen(),
//                       );
//                     },
//                     child: Text("Don't have an account? | Join us now"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignInService {
//   Future<Map<String, dynamic>> login(String email, String password) async {
//     final url = '$baseUrl/login';
//     Map<String, dynamic> data = await Api().post(
//       apiUrl: url,
//       body: {
//         'email': email,
//         'password': password,
//       },
//       token: "Bearer ${SharedPreferencesHelper.getUserToken()}",
//     );
//     print("Login Method ---- DONE");
//     print(data);
//     return data;
//   }
// }

// // Add this class for shared preferences
// class SharedPreferencesHelper {
//   static late SharedPreferences _preferences;

//   static const _isOwnerKey = 'is_owner';
//   static const _userTokenKey = 'user_token';

//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();

//   static bool getIsOwner() => _preferences.getBool(_isOwnerKey) ?? false;

//   static Future setIsOwner(bool isOwner) async =>
//       await _preferences.setBool(_isOwnerKey, isOwner);

//   static String getUserToken() => _preferences.getString(_userTokenKey) ?? '';

//   static Future setUserToken(String userToken) async =>
//       await _preferences.setString(_userTokenKey, userToken);
// }
