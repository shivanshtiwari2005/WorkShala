import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();
  final String _keyUserData = 'userdata';
  final String _keyToken = 'token';

  Future setToken(String token) async {
    await storage.write(key: _keyToken, value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _keyToken);
  }

  Future setUserData(Object userdata) async {
    String jsonString = jsonEncode(userdata);
    await storage.write(key: _keyUserData, value: jsonString);
  }

  Future<Map<String, dynamic>?> getUserData() async {
    // Read the JSON string from storage
    String? jsonString = await storage.read(key: _keyUserData);

    // If the JSON string is not null, deserialize it to a Map<String, dynamic>
    if (jsonString != null) {
      try {
        // Use jsonDecode to convert the JSON string to a Map
        Map<String, dynamic> userData = jsonDecode(jsonString);
        return userData;
      } catch (e) {
        // Handle any potential errors during deserialization
        print("Error decoding JSON: $e");
        return null;
      }
    }

    // Return null if the JSON string was null
    return null;
  }
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    // Implementation to save userData securely
    // For example, you might use a package like flutter_secure_storage

    // Replace the following line with your actual implementation
    print('Saving user data: $userData');
  }
}
