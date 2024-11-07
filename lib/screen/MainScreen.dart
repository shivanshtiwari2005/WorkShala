// Import necessary packages and screens
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/jobdis.dart';
import 'package:intershipapp/screen/Home.dart';
import 'package:intershipapp/screen/Profile.dart';
import 'package:intershipapp/screen/Settings.dart';
import 'package:intershipapp/secureStorage.dart';
import 'package:intershipapp/uploadScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  Future<void> fetchProfileData() async {
    try {
      String? accessToken = await _secureStorage.getToken();
      print("accessToken ${accessToken}");
      http.Response response = await http.get(
        Uri.parse('https://workshala-7v7q.onrender.com/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer $accessToken', // Include the token in the headers,
          'Cookie': 'accessToken=$accessToken'
        },
      );

      if (response.statusCode == 200) {
        // Parse and handle the profile data here
        Map<String, dynamic> profileData = jsonDecode(response.body);
        print("response ${profileData}");
        await _secureStorage.setUserData(profileData);

        // Use profileData as needed
      } else {
        // Handle errors
        print('Failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Fetch profile data when navigating to the ProfilePage
          if (index == 2) {
            fetchProfileData();
          }
        },
        children: <Widget>[
          Home(),
          jobDisPage(),
          ProfilePage(),
          // SettingsPage()
          // jobDisDetail(),
          // uploadScreen()
          // MORE PAGES WILL BE ADDED HERE
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list_alt, size: 30),
          Icon(Icons.person, size: 30),
          // Icon(Icons.settings, size: 30),
        ],
        color: const Color.fromARGB(255, 215, 189, 219),
        buttonBackgroundColor: const Color.fromARGB(255, 138, 170, 225),
        backgroundColor: Colors.transparent,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 8),
            curve: Curves.linear,
          );
        },
      ),
    );
  }
}
