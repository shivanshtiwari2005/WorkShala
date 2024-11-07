import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/loadingpage.dart';
import 'package:intershipapp/screen/Register.dart';
import 'package:intershipapp/screen/emailverify.dart';
import 'package:intershipapp/secureStorage.dart';
import 'package:intershipapp/widgets/Customtext.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailtext = TextEditingController();
  TextEditingController passwords = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController mobilee = TextEditingController();
  TextEditingController Lastname = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final SecureStorage _secureStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [buildheading(context), _inputField(context)],
    ));
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
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CustomText(
        //       text: "Sign in to your account",
        //       fontStyle: null,
        //       color: Colors.black,
        //       fontSize: 20,
        //     )
        //   ],
        // )
        // SizedBox(height: 20),
      ],
    );
  }

  _inputField(context) {
    return Form(
      key: _formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          // CustomTextFormField(),
          // CustomTextFormField(),

          buildtextfiled(context, firstname, "First Name", false),
          buildtextfiled(context, Lastname, "Last name", false),
          buildtextfiled(context, emailtext, "Email", false),
          buildtextfiled(context, mobilee, "Mobile", false),
          buildtextfiled(context, passwords, "Password", true),
          buildtextfiled(context, confirmpass, "Confirm Password ", true),

          // const SizedBox(height: 10),
          // Inside your _LoginState class
          Container(
            width: 400,
            margin: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // Form is valid, proceed with signUp and navigation
                  String email = emailtext.text;
                  String password = passwords.text;
                  String firstName = firstname.text;
                  String lastName = Lastname.text;
                  String mobile = mobilee.text;
                  String confirmPassword = confirmpass.text;

                  signUp(email, password, firstName, lastName, mobile,
                      confirmPassword);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const emailverify()));
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                backgroundColor: const Color.fromRGBO(148, 108, 195, 1),
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Sign up",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),

          // Padding(padding: EdgeInsets.only(bottom: 20)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "If you already registered",
                  fontStyle: null,
                  color: Colors.grey,
                  fontSize: 15,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: const CustomText(
                      text: "Log in",
                      fontStyle: null,
                      color: Colors.purple,
                      fontSize: 15,
                    ))
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
        ],
      ),
    );
  }

  Widget buildtextfiled(BuildContext context, TextEditingController controller,
      String hinttext, bool obscure) {
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid value';
          }
          return null;
        },

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
      ),
    );
  }

  Future<void> signUp(
    String email,
    String password,
    String name,
    String number,
    String lastnames,
    String confirmpassword,
  ) async {
    try {
      // Assuming you have a valid token stored in a variable named 'accessToken'
      String accessToken = "";

      Map<String, String> requestBody = {
        'email': emailtext.text,
        'password': passwords.text,
        'name': firstname.text,
        'number': mobilee.text,
        'lastname': Lastname.text,
        'confirmpassword': confirmpass.text
      };

      http.Response response = await http.post(
        Uri.parse('https://workshala-7v7q.onrender.com/register'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer $accessToken', // Include the token in the headers
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        await _secureStorage.setToken(data['accessToken']);
        print(response.body);
        showSnackBar('Account created successfully');
      } else {
        showSnackBar('Failed with status code: ${response.statusCode}');
        showSnackBar('Response body: ${response.body}');
      }
    } catch (e) {
      showSnackBar('Error: $e');
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
}
