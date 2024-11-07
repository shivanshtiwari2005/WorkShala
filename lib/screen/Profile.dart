import 'package:flutter/material.dart';
import 'package:intershipapp/screen/Register.dart';
import 'package:intershipapp/screen/Settings.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/secureStorage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> userData = new Map();
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    fetchSecureStorageData();
  }

  Future<void> fetchSecureStorageData() async {
    userData = await _secureStorage.getUserData() ?? {};
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                      radius: 50,
                      // Add your user's profile image here
                      backgroundImage:
                          AssetImage('assests/images/profiel.png')),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Text(
                        userData['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(userData['email'] ?? ''),
                      const Text('Since 2022'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Wallet and Courses Container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //   ],
                    // ),
                    const VerticalDivider(
                      color: Colors.grey,
                      width: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Courses'),
                        Text('${userData['skills'] ?? ''}'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                title: const Text('Your Favourite'),
                onTap: () {
                  // Handle Payment action
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Payment'),
                onTap: () {
                  // Handle Payment action
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Tell Your Friends'),
                onTap: () {
                  // Handle Tell Your Friends action
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: const Text('Promotions'),
                onTap: () {
                  // Handle Promotions action
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                  // Handle Settings action
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                  // Handle Log Out action
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: ProfilePage(),
    ),
  );
}
