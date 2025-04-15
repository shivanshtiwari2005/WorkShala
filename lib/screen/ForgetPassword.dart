import 'package:flutter/material.dart';
import 'package:intershipapp/screen/NewPassword.dart';
import 'package:intershipapp/screen/OtpVerify.dart';
import 'package:intershipapp/screen/Register.dart';
import 'package:intershipapp/widgets/Customtext.dart';
import 'package:http/http.dart' as http;

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  TextEditingController emailcontrller = TextEditingController();
  Future<void> resetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse('https://workshala-7v7q.onrender.com/forgotPassword'),
        body: {'email': email},
      );

      if (response.statusCode == 200) {
        print('API Response: ${response.statusCode} - ${response.body}');
        // Password reset request successful
        // You can handle the response accordingly
        // print(email);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OtpVerify()));
        print('Password reset email sent successfully');
      } else {
        // Password reset request failed
        // Handle the error, parse the error response, and provide feedback to the user
        print(
            'Password reset request failed. Status code: ${response.statusCode}');
        print('Error message: ${response.body}');
        // You might want to show an error message to the user
      }
    } catch (e) {
      // Handle any exceptions that might occur during the HTTP request
      print('Error during password reset request: $e');
      // You might want to show a generic error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forget Password",
          style: TextStyle(color: Colors.purple),
        ),
        // backgroundColor: Colors.purpleAccent,
      ),
      body: ListView(
        children: [
          // Padding(padding: EdgeInsets.only(left: 90)),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
                "Please enter your e-mail address. you will receive an e-mail along with a link which can be used to reset your password"),
          ),
          buildtextfiled(context, emailcontrller, "Enter Email", false),
          Container(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {
                // resetPassword(Forgetpasss.text);
                resetPassword(emailcontrller.text);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Register()));
              },
              style: ElevatedButton.styleFrom(
                shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                backgroundColor: const Color.fromRGBO(148, 108, 195, 1),
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "I am not receiving password reset email.",
                  fontStyle: null,
                  color: Colors.grey,
                  fontSize: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: const CustomText(
                      text: "Need Help?",
                      fontStyle: null,
                      color: Colors.purple,
                      fontSize: 10,
                    ))
              ],
            ),
          ),
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
}
