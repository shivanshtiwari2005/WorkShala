// import 'dart:html';

import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:intershipapp/jobdis.dart';
import 'package:intershipapp/secureStorage.dart';
import 'package:intershipapp/utilities.dart';
import 'package:intershipapp/screen/MainScreen.dart';
import 'package:intershipapp/screen/Home.dart';
// import 'package:workshala/jobdis.dart';
// import 'package:workshala/utilities.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({super.key});

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  final List<String> myStringList = ['String 1', 'String 2', 'String 3'];
  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 229, 245),
      body: bottomDrawer(),
    );
  }
}

final SecureStorage _secureStorage = SecureStorage();

class bottomDrawer extends StatelessWidget {
  const bottomDrawer({super.key});

  Future<void> makeApiRequest(List<String> selectedSkills) async {
    String? accessToken = await _secureStorage.getToken();
    const apiUrl = 'https://workshala-7v7q.onrender.com/welcome';
    final apiToken = 'Bearer $accessToken';

    final requestBody = jsonEncode({
      "workStatus": "Experienced",
      "skills": selectedSkills,
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': apiToken,
      },
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print('API Response: ${response.body}');
    } else {
      print('API Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        height: screenHeight * 0.035,
      ),
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          // height: screenHeight * ,
          // height: screenH,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              height: screenHeight * 0.028,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                returnButton(
                    'assets/return.png',
                    const Color.fromARGB(32, 229, 4, 4),
                    28.0,
                    28.0,
                    context,
                    const loadingPage()),
                const SizedBox(
                  width: 18,
                ),
                const Text(
                  'Catogries',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 0, 0, 0)),
                )
              ],
            )),
            Container(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 10, 0),
                child: Row(
                  children: [
                    Text(
                      'Choose 3-5 catogries and we`ll optimize the \nvacancies for you.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Inter',
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.0283,
            ),
            SizedBox(
                height: screenHeight * 0.63,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  SelectableBox(
                                      image: 'assets/crypto (1).png',
                                      height: 105.0,
                                      width: 120.0,
                                      text: 'java'),
                                  SelectableBox(
                                      image: 'assets/bank.png',
                                      height: 105.0,
                                      width: 120.0,
                                      text: 'flutter'),
                                ],
                              ))),
                      SizedBox(
                        height: screenHeight * 0.028,
                      ),
                      Container(
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  SelectableBox(
                                      image: 'assets/programming2.png',
                                      height: 105.0,
                                      width: 120.0,
                                      text: 'css'),
                                  // const SizedBox(
                                  //   width: 0,
                                  // ),
                                  SelectableBox(
                                      image: 'assets/food.png',
                                      height: 105.0,
                                      width: 120.0,
                                      text: 'html'),
                                ],
                              ))),
                      SizedBox(
                        height: screenHeight * 0.0285,
                      ),
                      Container(
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  SelectableBox(
                                      image: 'assets/human.png',
                                      height: 105.0,
                                      width: 120.0,
                                      text: 'machine learning'),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  SelectableBox(
                                      image: 'assets/content.png',
                                      height: 105.0,
                                      width: 120.0,
                                      text: 'java script'),
                                ],
                              ))),
                      SizedBox(
                        height: screenHeight * 0.0285,
                      ),
                      Container(
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  SelectableBox(
                                      image: 'assets/art.png',
                                      height: 105.0,
                                      width: 120.0,
                                      text: 'Art & Design'),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  SelectableBox(
                                      image: 'assets/custom.png',
                                      height: 105.0,
                                      width: 120.0,
                                      text: 'Customer Service'),
                                ],
                              ))),
                    ],
                  ),
                )),
            const SizedBox(
              height: 7,
            ),
          ])),
      SizedBox(
        height: screenHeight * 0.0285,
      ),
      Container(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 13,
                  ),
                  nextButtonBox('Skip', 141.0, 45.0, context,
                      const MainScreen(), () => {}),
                  nextButtonBox(
                      'Next',
                      141.0,
                      45.0,
                      context,
                      const MainScreen(),
                      makeApiRequest(['IT', 'Marketing', 'Finance'])),
                ],
              )))
    ]));
  }
}
