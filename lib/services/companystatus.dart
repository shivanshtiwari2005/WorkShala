import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:intershipapp/models/companyData.dart';
import 'package:intershipapp/services/ApiUrl.dart';

class CompanyServices {
  Future<companyData> fecthCompanystatusData() async {
    final response = await http.get(Uri.parse(AppUrl.CompanyDataApi));

    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body);
    //   return companyData.fromJson(data);
    // } else {
    //   throw Exception('Error');
    // }
    if (response.statusCode == 200) {
      // final Map<String, dynamic> decodedData = json.decode(response.body);
      var data = jsonDecode(response.body);
      // return companyData.fromJson(data);

      if (data.containsKey("companies")) {
        return companyData.fromJson(data);
      } else {
        throw Exception('Invalid data format - missing "companies" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
