import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/screen/Register.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  Future<void> setNewPassword(
      String email, String newPassword, String token) async {
    try {
      final response = await http.post(
        Uri.parse('https://workshala-7v7q.onrender.com/setNewPassword'),
        headers: {
          'Authorization': 'Bearer $token', // Add your access token here
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        // Password reset successful
        // You can handle the response accordingly
        print('Password reset successful');
        // Navigate to the next screen or perform other actions
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()),
        );
      } else {
        // Password reset failed
        // Handle the error, parse the error response, and provide feedback to the user
        print('Password reset failed. Status code: ${response.statusCode}');
        print('Error message: ${response.body}');
        // You might want to show an error message to the user
      }
    } catch (e) {
      // Handle any exceptions that might occur during the HTTP request
      print('Error during password reset: $e');
      // You might want to show a generic error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Password",
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: ListView(
        children: [
          buildTextField(context, emailController, "Enter your Email", false),
          buildTextField(
              context, newPasswordController, "Enter new Password", true),
          ElevatedButton(
            onPressed: () {
              // Call the setNewPassword function with the entered email and new password
              setNewPassword(
                  emailController.text, newPasswordController.text, widget.token
                  // .body.text,
                  );
            },
            style: ElevatedButton.styleFrom(
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: const Color.fromRGBO(148, 108, 195, 1),
              minimumSize: const Size(double.infinity, 50),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Set New Password",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(BuildContext context, TextEditingController controller,
      String hintText, bool obscure) {
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
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixStyle: const TextStyle(color: Colors.indigo),
        ),
      ),
    );
  }
}
