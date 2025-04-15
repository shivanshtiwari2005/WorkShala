import 'package:flutter/material.dart';
import 'package:intershipapp/screen/ForgetPassword.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool enableNotifications = true;
  bool darkMode = false;
  bool receiveUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(148, 108, 195, 1)),
              ),
              // const SizedBox(height: 16),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Color.fromRGBO(148, 108, 195, 1),
                ),
                title: const Text(
                  "Account",
                  style: TextStyle(
                      color: Color.fromRGBO(148, 108, 195, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Handle Edit Profile action
                },
              ),
              ListTile(
                title: const Text("Edit Profile"),
                onTap: () {
                  // Handle Edit Profile action
                },
              ),
              ListTile(
                title: const Text("Change Password"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Forgetpass()));
                  // Handle Change Password action
                },
              ),
              ListTile(
                title: const Text("Privacy"),
                onTap: () {
                  // Handle Privacy action
                },
              ),
              const ListTile(
                leading: Icon(Icons.notification_add,
                    color: Color.fromRGBO(148, 108, 195, 1)),
                title: Text(
                  "Notification",
                  style: TextStyle(
                      color: Color.fromRGBO(148, 108, 195, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SwitchListTile(
                title: const Text("Enable Notifications"),
                value: enableNotifications,
                onChanged: (value) {
                  setState(() {
                    enableNotifications = value;
                  });
                },
              ),
              ListTile(
                title: const Text("Updates"),
                subtitle: const Text("Receive app updates"),
                trailing: Switch(
                  value: receiveUpdates,
                  onChanged: (value) {
                    setState(() {
                      receiveUpdates = value;
                    });
                  },
                ),
              ),
              const ListTile(
                title: Text(
                  "Other",
                  style: TextStyle(
                      color: Color.fromRGBO(148, 108, 195, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SwitchListTile(
                title: const Text("Dark Mode"),
                value: darkMode,
                onChanged: (value) {
                  setState(() {
                    darkMode = value;
                  });
                },
              ),
              ListTile(
                title: const Text("Language"),
                onTap: () {
                  // Handle Language action
                },
              ),
              ListTile(
                title: const Text("Region"),
                onTap: () {
                  // Handle Region action
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: SettingsPage(),
    ),
  );
}
