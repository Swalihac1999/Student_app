import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:open_settings/open_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../home_page/home_page.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

String? stringValue;
String? stringValue3;
bool hasinternet = false;

class _Login_pageState extends State<Login_page> {
  late TextEditingController userNameCon =
      TextEditingController(text: stringValue);
  late TextEditingController passwordCon =
      TextEditingController(text: stringValue3);
  final _formKey = GlobalKey<FormState>();

  bool _obsecuretext = true;
  void _toggle() {
    setState(() {
      _obsecuretext = !_obsecuretext;
    });
  }

  Future<void> loginFel(String username, String password) async {
    try {
      var response = await http.post(
        Uri.parse('http://collage.lucidetech.com/api/login'),
        body: {
          'username': username,
          'password': password,
        },
      );
      // Check if the response is successful

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData[0]["api_status"] == '1') {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('user_id', responseData[0]['user_id']);
          prefs.setString('user_roll', responseData[0]['user_roll']);
          prefs.setString('user_name', responseData[0]['user_name']);
          prefs.setString('api_status', responseData[0]['api_status']);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('invalid username or password'),
          ));
          print('dasdA');
        }
        print(responseData);
      } else {
        throw Exception('Failed to log in.');
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 58, 80),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.27,
                      left: width * 0.07,
                      right: width * 0.07),
                  child: textField(const Icon(Icons.person), 'User Name',
                      userNameCon, stringValue.toString()),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.07,
                      right: width * 0.07),
                  child: TextFormField(
                    obscureText: _obsecuretext,
                    validator: (valuee) {
                      if (valuee!.isEmpty) {
                        return 'Please Enter a Password';
                      }
                      return null;
                    },
                    onSaved: (valuee) => stringValue3 = valuee!.toString(),
                    controller: passwordCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 142, 131, 131)
                                .withOpacity(0.6)),
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: _toggle,
                        icon: Icon(
                            _obsecuretext
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off,
                            color: Colors.white),
                      ),
                      hintStyle: GoogleFonts.abel(
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontSize: 14),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 142, 131, 131)
                          .withOpacity(0.6),
                      prefixIcon: const Icon(Icons.lock_open_outlined),
                      prefixIconColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.04),
          SizedBox(
            height: height * 0.05,
            child: Padding(
              padding: EdgeInsets.only(
                left: width * 0.09,
                right: width * 0.09,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    loginFel(userNameCon.text.toString(),
                        passwordCon.text.toString());
                    hasinternet =
                        await InternetConnectionChecker().hasConnection;
                    if (hasinternet == false) {
                      _showdialog();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent.withOpacity(0.6),
                ),
                child: Text(
                  'Sign in',
                  style: GoogleFonts.actor(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.32, top: height * 0.02),
            child: Text(
              'Forgot your password?',
              style: GoogleFonts.abel(color: Colors.white.withOpacity(0.8)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.14,
              left: width * 0.38,
            ),
            child: Text(
              'Connect with',
              style: GoogleFonts.abel(
                  color: Colors.white.withOpacity(1), fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.32),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                      width: width * 0.08,
                      height: height * 0.08,
                      child: Image.asset(
                        'assets/images/facebook.png',
                      )),
                  const VerticalDivider(
                    color: Colors.white,
                    width: 16,
                    indent: 24,
                    endIndent: 24,
                  ),
                  SizedBox(
                      width: width * 0.08,
                      height: height * 0.08,
                      child: Image.asset('assets/images/gmail.png')),
                  const VerticalDivider(
                    color: Colors.white,
                    width: 16,
                    indent: 24,
                    endIndent: 24,
                  ),
                  SizedBox(
                      width: width * 0.08,
                      height: height * 0.08,
                      child: Image.asset('assets/images/twiter.png')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField textField(
      Icon icon, String text, TextEditingController controller, String passla) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter a $text';
        }
        return null;
      },
      onSaved: (value) => passla = value!,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
              width: 1,
              color: const Color.fromARGB(255, 142, 131, 131).withOpacity(0.6)),
        ),
        hintText: text,
        hintStyle: GoogleFonts.abel(
            color: Colors.white, letterSpacing: 1.2, fontSize: 14),
        filled: true,
        fillColor: const Color.fromARGB(255, 142, 131, 131).withOpacity(0.6),
        prefixIcon: icon,
        prefixIconColor: Colors.white,
      ),
    );
  }

  void _showdialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Lottie.asset('assets/images/19832-no-internet.json',
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1),
          content:
              const Text('Please check your internet connection and try again'),
          actions: [
            MaterialButton(
              onPressed: () {
                OpenSettings.openNetworkOperatorSetting();
              },
              child: const Text('Turn on mobile data'),
            ),
            MaterialButton(
              onPressed: () {
                OpenSettings.openWIFISetting();
              },
              child: const Text('Turn on wifi'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}




































































// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../home_page/home_page.dart';

// class Login_page extends StatefulWidget {
//   const Login_page({Key? key}) : super(key: key);

//   @override
//   State<Login_page> createState() => _Login_pageState();
// }

// class _Login_pageState extends State<Login_page> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void login(String email, password) async {
//     try {
//       Response response = await post(
//           Uri.parse('http://collage.lucidetech.com/api/login'),
//           body: {
//             'username': emailController.text,
//             'password': passwordController.text
//           });
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());
//         if (data[0]["api_status"] == '1') {
//           final prefs = await SharedPreferences.getInstance();
//           prefs.setString('user_id', data[0]['user_id']);
//           prefs.setString('user_roll',data[0]['user_roll']);
//           prefs.setString('user_name',data[0]['user_name']);
//           prefs.setString('api_status', data[0]['api_status']);
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Home(),
//               ));
//         }
//       } else {
//         print('failed');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaquery = MediaQuery.of(context);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color.fromARGB(255, 7, 41, 68),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             textField(
//                 mediaquery,
//                 Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 ),
//                 'Email',
//                 emailController),
//             textField(
//                 mediaquery,
//                 Icon(
//                   Icons.lock,
//                   color: Colors.white,
//                 ),
//                 'Password',
//                 passwordController),
//             SizedBox(
//               height: mediaquery.size.height * 0.05,
//             ),
//             SizedBox(
//               width: mediaquery.size.width * 0.80,
//               height: mediaquery.size.height * 0.07,
//               child: ElevatedButton(
//                   onPressed: () {
//                     login(emailController.text.toString(),
//                         passwordController.text.toString());
//                   },
//                   child: Text('Sign in'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   )),
//             ),
//             SizedBox(height: mediaquery.size.height * 0.02),
//             TextButton(onPressed: () {}, child: Text("Forget Password ?")),
//             SizedBox(height: mediaquery.size.height * 0.08),
//             Text(
//               'Connect with',
//               style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w100),
//             ),
//             SizedBox(height: mediaquery.size.height * 0.02),
//             Padding(
//               padding: EdgeInsets.only(left: mediaquery.size.width * 0.2),
//               child: IntrinsicHeight(
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/facebook.png',
//                       height: mediaquery.size.height * 0.060,
//                     ),
//                     VerticalDivider(
//                       color: Colors.white,
//                       width: 16,
//                       indent: 24,
//                       endIndent: 24,
//                     ),
//                     Image.asset(
//                       'assets/images/gmail.png',
//                       height: mediaquery.size.height * 0.060,
//                     ),
//                     VerticalDivider(
//                       color: Colors.white,
//                       width: 16,
//                       indent: 24,
//                       endIndent: 24,
//                     ),
//                     Image.asset(
//                       'assets/images/twiter.png',
//                       height: mediaquery.size.height * 0.060,
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Padding textField(MediaQueryData mediaquery, Icon icon, String text,
//       TextEditingController controller) {
//     return Padding(
//       padding: EdgeInsets.only(
//           top: mediaquery.size.height * 0.02,
//           left: mediaquery.size.width * 0.09,
//           right: mediaquery.size.width * 0.09),
//       child: TextFormField(
//         style: TextStyle(color: Colors.white),
//         controller: controller,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//               // borderRadius: BorderRadius.circular(20),
//               ),
//           prefixIcon: icon,
//           hintStyle: const TextStyle(color: Colors.grey, letterSpacing: 1.3),
//           hintText: text,
//           fillColor: Colors.white,
//         ),
//       ),
//     );
//   }
// }
