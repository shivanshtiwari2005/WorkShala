import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intershipapp/models/courses.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:intershipapp/jobdis.dart';
import 'package:intershipapp/screen/FilterpageScreen.dart';
// import:'package:flutter/src/rendering/box.dart':
import 'package:intershipapp/secureStorage.dart';
import 'package:intershipapp/widgets/Buildinkwell.dart';
import 'package:intershipapp/widgets/courseRec.dart';
import 'package:intershipapp/widgets/jobcontainer.dart';
import 'package:intershipapp/models/companyData.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/services/companystatus.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

// ignore: non_constant_identifier_names
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // ignore: unused_local_variable
  TextEditingController searchbar = TextEditingController();

  Map<String, dynamic> userData = {};
  final SecureStorage _secureStorage = SecureStorage();

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
    fetchSecureStorageData();
  }

  Future<void> fetchSecureStorageData() async {
    userData = await _secureStorage.getUserData() ?? {};
    setState(() {});
  }

  Future<List<List<dynamic>?>> retrieveDataForElements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? retrievedList = prefs.getStringList('myKey');
    List<List<dynamic>?> fetchedDataList = []; // Specify the type explicitly

    if (retrievedList != null) {
      for (String element in retrievedList) {
        try {
          final response = await http.get(
            Uri.parse('https://course2.onrender.com/recommend/$element'),
          );

          if (response.statusCode == 200) {
            final Map<String, dynamic> decodedData = json.decode(response.body);

            if (decodedData.containsKey("courses")) {
              fetchedDataList.add(decodedData["courses"]);
            } else {
              throw Exception('Invalid data format - missing "courses" key');
            }
          } else {
            throw Exception('Failed to load data');
          }
        } catch (error) {
          debugPrint('Error fetching data for $element: $error');
          // Handle errors if needed
        }
      }
    }

    // Return fetchedDataList even if retrievedList is null
    return fetchedDataList;
  }

  // //
  Future<List<dynamic>?> fetchDataa() async {
    final response = await http
        .get(Uri.parse('https://workshala-7v7q.onrender.com/companyData'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      if (decodedData.containsKey("companies")) {
        return decodedData["companies"];
      } else {
        throw Exception('Invalid data format - missing "companies" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
  //

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // CompanyServices companyServices = CompanyServices();
    var userData;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData['name'] ?? 'User Name',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Text(userData['email'] ?? 'user@example.com'),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // Handle notification button press
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              buildtextfiled(context, searchbar, "search", false, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FilterScreenPage()),
                );
              }),
              const SizedBox(height: 16.0),
              Container(
                child: GestureDetector(
                    onTap: () {
                      // Navigate to the second screen on tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilterScreenPage()),
                      );
                    },
                    child: Row(children: [
                      const Spacer(),
                      const Text(
                        'Filter   ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                      Image.asset(
                        'assets/filter.png',
                        height: screenHeight * 0.02,
                      ),
                    ])),
              ),
              Image.asset(
                'assests/images/Frame 16.png',
                height: screenHeight * 0.23,
              ),
              const SizedBox(height: 16.0),
              Container(
                  child: Row(children: [
                const Text(
                  '  Recommended Courses',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CrustomBox()));
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(color: Colors.blue),
                    )),
              ])),
              const SizedBox(height: 8.0),

              SizedBox(
                height: screenHeight * 0.28, // Adjust the height as needed
                // child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: FutureBuilder<List<List<dynamic>?>?>(
                  future: retrieveDataForElements(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<List<dynamic>?>? fetchedDataList = snapshot.data;

                      if (fetchedDataList == null || fetchedDataList.isEmpty) {
                        return const Center(child: Text('No data available.'));
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fetchedDataList.length,
                        itemBuilder: (context, index) {
                          // if (fetchedDataList == null) {
                          //   return Container();
                          // }
                          List<dynamic>? companyData = fetchedDataList[index];
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.all(9),
                            // height: screenHeight * 0.3,
                            width: screenWidth * 0.99,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFF946CC3)),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 9.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        // const SizedBox(height: 15.0),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                          // child: Image.network(
                                          //   companyData[index]['img'],
                                          //   width: screenWidth * 0.125,
                                          //   height: screenHeight * 0.064,
                                          //   scale: 8.0,
                                          // ),
                                        ),
                                        SizedBox(width: screenWidth * 0.019),
                                        Container(
                                          width: screenWidth * 0.6,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Courses: ${companyData?[index]['courses']}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  ' Level: ${companyData?[index][' Level']}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Handle tap
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: const Icon(
                                          Icons.favorite_outlined,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                const Divider(),
                                // Text(
                                //   '   Description: ${companyData?[index]['Description']}',
                                //   style: const TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w600,
                                //     color: Color(0xD6595961),
                                //   ),
                                // ),
                                Container(
                                    height: screenHeight * 0.08,
                                    child: SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text(
                                            '   Skills Covered: ${companyData?[index]['Skills Covered']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              color: const Color(0xFF246BFD),
                                            ),
                                          ),
                                        ]))),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 1,
                                          left: 19,
                                          right: 15,
                                          bottom: 3),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            148, 108, 195, 1),
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: const Text(
                                        'Online',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigate to the next screen on tap
                                        },
                                        child: Text(
                                          'View Details',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF246BFD),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),

              // ),
              Row(
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Recent Jobs',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CustomBox()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.all(9)),
                    BuildInkwllTo(
                      name: 'All',
                    ),
                    Padding(padding: EdgeInsets.all(9)),
                    BuildInkwllTo(
                      name: 'Design',
                    ),
                    Padding(padding: EdgeInsets.all(9)),
                    BuildInkwllTo(
                      name: 'Technology',
                    ),
                    Padding(padding: EdgeInsets.all(9)),
                    BuildInkwllTo(
                      name: 'AirSpace',
                    ),
                    Padding(padding: EdgeInsets.all(9)),
                    BuildInkwllTo(
                      name: 'Writing',
                    ),
                    Padding(padding: EdgeInsets.all(9)),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.85, // Adjust the height as needed
                // child: SingleChildScrollView(
                child: FutureBuilder<List<dynamic>?>(
                  future: fetchDataa(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<dynamic>? companyData = snapshot.data;

                      return ListView.builder(
                        itemCount: companyData?.length ?? 0,
                        itemBuilder: (context, index) {
                          if (companyData == null) {
                            return Container();
                          }
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.all(9),
                            // height: screenHeight * 0.3,
                            width: screenWidth * 0.92,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF946CC3)),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 9.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        // const SizedBox(height: 15.0),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                          child: Image.network(
                                            companyData[index]['img'],
                                            width: screenWidth * 0.125,
                                            height: screenHeight * 0.064,
                                            scale: 8.0,
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.019),
                                        Container(
                                            width: screenWidth * 0.55,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Company name: ${companyData[index]['title']}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Company Type: ${companyData[index]['companyType']}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Handle tap
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Icon(
                                          Icons.favorite_outlined,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                Divider(),
                                Text(
                                  '   Location: ${companyData[index]['location']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xD6595961),
                                  ),
                                ),
                                Text(
                                  '   Industry: ${companyData[index]['industry']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Color(0xFF246BFD),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 1,
                                          left: 19,
                                          right: 15,
                                          bottom: 3),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            148, 108, 195, 1),
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: const Text(
                                        'Online',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigate to the next screen on tap
                                        },
                                        child: Text(
                                          'View Details',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF246BFD),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ])),
      ),
    );
  }

  Widget buildtextfiled(BuildContext context, TextEditingController controller,
      String hinttext, bool obscure, VoidCallback onChanged) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [],
      ),
      margin: const EdgeInsets.all(15),
      child: TextField(
        onChanged: (_) {
          onChanged();
        },
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.keyboard_option_key_sharp),
            fillColor: const Color.fromRGBO(148, 108, 195, 0.1),
            filled: true,
            hintText: hinttext,
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            suffixStyle: const TextStyle(color: Colors.indigo)),
      ),
    );
  }

  // retrieveDataForElements() {}

  // TextEditingController searchbar = TextEditingController();
}
