 import 'package:flutter/material.dart';

Widget buildtextfiled(BuildContext context, TextEditingController controller,
      String hinttext, bool obscure, Null Function() param4,String? Function(String?) validator) {
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