import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/loadingpage.dart';
import 'package:intershipapp/screen/ForgetPassword.dart';
import 'package:intershipapp/screen/Home.dart';
import 'package:intershipapp/screen/Login.dart';
import 'package:intershipapp/screen/MainScreen.dart';
import 'package:intershipapp/secureStorage.dart';
import 'package:intershipapp/widgets/CustomTextButton.dart';
import 'package:intershipapp/widgets/Customtext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final emailtext = TextEditingController();
  // final passwords = TextEditingController();
  bool rememberme = false;
  // late SharedPreferences prefs;
  final _formKey = GlobalKey<FormState>();
  // final SecureStorage _secureStorage = SecureStorage();

  bool? isChecked = false;
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  late SharedPreferences prefs;
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  // bool _isValidPassword(String password) {
  //   // Use a regex pattern for password validation
  //   // This example requires at least 6 characters, including an uppercase letter, a lowercase letter, and a number.
  //   RegExp regex = RegExp(r'^(?=.[a-z])(?=.[A-Z])(?=.*\d).{6,}$');
  //   return regex.hasMatch(password);
  // }

  Future<void> login(String email, String password) async {
    try {
      Map<String, String> loginData = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('https://workshala-7v7q.onrender.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginData),
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        dynamic setCookieHeader = response.headers['set-cookie'];

        List<String>? cookies;

        print('Response headers: ${response.headers}');
        print('Cookies from response: ${response.headers['set-cookie']}');

        if (setCookieHeader is String) {
          cookies = [setCookieHeader];
        } else if (setCookieHeader is List<String>) {
          cookies = setCookieHeader;
        } else {
          cookies = [];
        }

        print('Response Headers: $setCookieHeader');

        String accessToken = '';

        if (cookies.isNotEmpty) {
          accessToken = cookies
              .map((cookie) => cookie.split(';').first)
              .firstWhere((value) => value.startsWith('accessToken='),
                  orElse: () => '');
        }
        if (accessToken.isNotEmpty) {
  accessToken = accessToken.replaceFirst('accessToken=', '');
}

print('Extracted accessToken: $accessToken');

        print('Access Token from Cookie: $accessToken');

        if (accessToken.isNotEmpty) {
          prefs.setString('token', accessToken);
          await _secureStorage.setToken(accessToken);
          print('Token stored in prefs: $accessToken');
        } else {
          // Handle the case where the token is empty
          print('Token is empty');
        }

        final Map<String, dynamic> responseData = json.decode(response.body);
        final message = responseData['message'];
        final emailid = responseData['email'];
        print('User Emailisssssss: $emailid');
        print('Message from APIssss: $message');
        final user = responseData['user'];

        // await _secureStorage.setToken(responseData['accessToken']);
        // final email = user['email'];
        // final name = user['name'];

        // -----------------------------------------------------------------------
        print('Message from API: $message');

        print('User Email: $email');
        // print('User Name: $name');

        prefs.setString('userEmail', email);
        // prefs.setString('userName', name);

        // Now navigate to the next screen
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => categories()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final message = responseData['message'];

        print('Failed with status code: ${response.statusCode}');
        print('Response body: $message');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 3),
          ),
        );
        // showSnackBar('Login failed. Please check your credentials.');
      }
    } catch (e) {
      print('Error: $e');
      showSnackBar('An unexpected error occurred.');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            buildheading(context),
            _inputField(context),
            buildelevatedbutton(context),
            buildtextbutton(BuildContext)
          ],
        ),
      ),
    );
  }

  Widget buildheading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Padding(padding: EdgeInsets.only(top: 100)),
        Image.asset("assests/images/Group.png"),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "WORK",
              color: Color.fromRGBO(148, 108, 195, 1),
              fontSize: 40,
              fontStyle: null,
              fontfamily: 'font',
            ),
            CustomText(
              text: "SHALA",
              color: Colors.black,
              fontSize: 40,
              fontStyle: null,
              fontfamily: 'font',
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Sign in to your account",
              fontStyle: null,
              color: Colors.black,
              fontSize: 20,
            )
          ],
        )
        // SizedBox(height: 20),
      ],
    );
  }

  _inputField(context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(padding: EdgeInsets.only(top: 50)),
        buildtextfiled(context, emailController, "Email", false, () {},
            (value) {
          if (value!.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        }),
        buildtextfiled(context, passwordController, "Password", true, () {
          setState(() {
            rememberme = true;
          });
        }, (value) {
          if (value!.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        }),

        Row(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Checkbox(
              value: rememberme,
              onChanged: (bool? value) {
                setState(() {
                  rememberme = value ?? false;
                });
              },
            ),
            const Text(
              'Remember Me',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),

        // const SizedBox(height: 10),
        Container(
          width: 400,
          margin: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () async {
              login(emailController.text, passwordController.text);
              // if (_formKey.currentState?.validate() ?? false) {
              //   String email = emailtext.text;
              //   String password = passwords.text;

              //   try {
              //     // Make the HTTP request to the login API endpoint
              //     http.Response response = await http.post(
              //       Uri.parse('https://workshala-7v7q.onrender.com/login'),
              //       headers: {'Content-Type': 'application/json'},
              //       body: jsonEncode({'email': email, 'password': password}),
              //     );

              //     if (response.statusCode == 200) {
              //       // Login successful
              //       final Map<String, dynamic> data = jsonDecode(response.body);
              //       await _secureStorage.setToken(data['accessToken']);

              //       print("login successfull");
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const MainScreen()));
              //     } else {
              //       // Login failed, show error message
              //       print(
              //           'Login failed with status code: ${response.statusCode}');
              //       print('Response body: ${response.body}');
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(
              //           content: Text(
              //               'Login failed. Please check your credentials.'),
              //           duration: Duration(seconds: 3),
              //         ),
              //       );
              //     }
              //   } catch (e) {
              //     // Handle other exceptions
              //     print('Error during login: $e');
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(
              //         content: Text('An error occurred. Please try again.'),
              //         duration: Duration(seconds: 3),
              //       ),
              //     );
              //   }
              // }
            },
            style: ElevatedButton.styleFrom(
              // shape: const StadiumBorder(),
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),

              backgroundColor: const Color.fromRGBO(148, 108, 195, 1),
              minimumSize: const Size(double.infinity, 50),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Sign in",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Forgetpass()));
                },
                child: const CustomText(
                  text: "Forget Password ?",
                  fontStyle: null,
                  color: Colors.purple,
                  fontSize: 15,
                ))
          ],
        ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CustomText(
        //       text: "continue with",
        //       fontStyle: null,
        //       color: Colors.black,
        //       fontSize: 20,
        //     )
        //   ],
        // ),

        // Padding(padding: EdgeInsets.only(bottom: 20)),
        // Container(
        //   child: const CustomText(
        //     text: "If you already registered Log In",
        //     fontStyle: null,
        //     color: Colors.grey,
        //     fontSize: 15,
        //   ),
        // ),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
      ],
    );
  }

  Widget buildtextfiled(
      BuildContext context,
      TextEditingController controller,
      String hinttext,
      bool obscure,
      Null Function() param4,
      String? Function(String?) validator) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(148, 108, 195, 0.25).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(15),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        // enabled: false,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            fillColor: const Color.fromRGBO(238, 238, 238, 1),
            filled: true,
            hintText: hinttext,
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
                // borderSide: const BorderSide(color: Colors.blue),
                ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            // disabledBorder: OutlineInputBorder()

            // suffixText: "hbchjdbch",

            suffixStyle: const TextStyle(color: Colors.indigo)),
        validator: validator,
      ),
    );
  }

  Widget buildelevatedbutton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            // width: 150,
            // margin: consts EdgeInsets.all(15),
            // child: ElevatedButton.icon(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            //     padding: const EdgeInsets.symmetric(vertical: 16),
            //   ),
            //   icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
            //   label: const Text(
            //     ' Google',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            // child: IconButton(
            //   onPressed: () {},
            //   icon: const Icon(FontAwesomeIcons.google),
            //   color: Colors.red,
            // ),
            ),
        // Container(
        //   // width: 150,
        //   // margin: const EdgeInsets.all(15),
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(FontAwesomeIcons.facebook),
        //     color: Colors.blue,
        //   ),
        // ),
      ],
    );
  }

  Widget buildtextbutton(BuildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomText(
          text: "Don’t have an account?",
          fontStyle: null,
          color: Colors.grey,
          fontSize: 18,
        ),
        CustomTextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          buttonText: "Sign up",
          buttonColor: Colors.white,
          textColor: Colors.purple,
          fontSize: 18,
        )
      ],
    );
  }
}
