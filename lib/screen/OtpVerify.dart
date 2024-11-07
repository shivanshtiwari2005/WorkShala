import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/screen/NewPassword.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({Key? key}) : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  TextEditingController emailotp = TextEditingController();
  TextEditingController otp = TextEditingController();

  Future<void> verifyOtp(
    String email,
    String enteredOtp,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('https://workshala-7v7q.onrender.com/verifyOtp'),
        body: {'email': email, 'otp': enteredOtp},
      );

      if (response.statusCode == 404 && response.body.contains('otp expired')) {
        // OTP expired, inform the user and possibly trigger a new OTP generation
        print('OTP has expired. Please request a new OTP.');
        // You can implement a mechanism to request a new OTP here
      } else if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // OTP verification successful, handle accordingly
        print('OTP verification successful');
        print('Otp token code: ${data}');
        print('***Token*** ${data['resetPasswordToken']}');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NewPassword(token: data['resetPasswordToken'])));
      } else {
        // Handle other cases or display an error message to the user
        print('OTP verification failed. Status code: ${response.statusCode}');
        print('Error message: ${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that might occur during the HTTP request
      print('Error during OTP verification: $e');
      // You might want to show a generic error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP Verification",
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: ListView(
        children: [
          buildtextfiled(context, emailotp, "Enter your Email", false),
          buildtextfiled(context, otp, "Enter OTP", false),
          ElevatedButton(
            onPressed: () async {
              // Call the verifyOtp function with the entered email and OTP
              await verifyOtp(emailotp.text, otp.text);
            },
            child: Text('Verify OTP'),
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
