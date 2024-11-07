import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/models/courses.dart';
import 'package:intershipapp/utilities.dart';
import 'package:intershipapp/jobdis.dart';
import 'package:intershipapp/screen/Home.dart';

class CrustomBox extends StatefulWidget {
  // const CustomBox({super.key});
  @override
  State<CrustomBox> createState() => _CrustomBoxState();
}

class _CrustomBoxState extends State<CrustomBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Text('Your Title Here'), // Replace with your desired title
      ),
      body: CrustomDetail(),
    );
  }
}

class CrustomDetail extends StatelessWidget {
  CrustomDetail({super.key});
  bool isFavorited = false;
  Future<List<dynamic>?> fetchData() async {
    final response = await http
        .get(Uri.parse('https://course2.onrender.com/recommend/flutter'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      if (decodedData.containsKey("courses")) {
        return decodedData["courses"];
      } else {
        throw Exception('Invalid data format - missing "courses" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<List<dynamic>?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic>? courses = snapshot.data;

            return ListView.builder(
                itemCount: courses?.length ?? 0,
                itemBuilder: (context, index) {
                  if (courses == null) {
                    return Container();
                  }
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(9),
                    height: screenHeight * 0.39,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Course name: ${courses[index]['courses']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: screenHeight * 0.011),
                                      Text(
                                        'Level: ${courses[index]['Level']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Color(0xFF246BFD),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: isFavorited ? Colors.red : null,
                                ),
                                child: Icon(
                                  Icons.favorite_outlined,
                                  color: isFavorited ? Colors.white : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Divider(),
                        Text(
                          'Description: ${courses[index]['Description']}',
                          style: const TextStyle(
                            fontWeight: null,
                            fontSize: 16,
                            color: Color(0xD6595961),
                          ),
                        ),
                        Text(
                          'Skills Covered: ${courses[index]['Skills Covered']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF246BFD),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Container(
                              // height: 20.0,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(148, 108, 195, 1),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Text(
                                'ONLINE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                            ),
                            Container(
                                child: GestureDetector(
                              onTap: () {
                                // Navigate to the next screen on tap
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => jobDisPage()),
                                );
                              },
                              child: Text(
                                'View Details',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF246BFD),
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  );
                });
          }
        });
  }
}
