// // import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intershipapp/models/courses.dart';
import 'package:intershipapp/utilities.dart';
import 'package:intershipapp/jobdis.dart';
import 'package:intershipapp/screen/Home.dart';

class CourseBox extends StatefulWidget {
  final String companyLogo;
  final String companyName;
  final String personName;
  final String placeName;
  final String moneyName;

  final bool isOnline;
  final VoidCallback onFavIconPressed;

  const CourseBox({
    super.key,
    required this.companyLogo,
    required this.companyName,
    required this.personName,
    required this.placeName,
    required this.moneyName,
    required this.isOnline,
    required this.onFavIconPressed,
  });

  @override
  State<CourseBox> createState() => _CourseBoxState();
}

class _CourseBoxState extends State<CourseBox> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(9),
      height: 230,
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
                      // color: Colors.blueGrey
                    ),
                    child: Image.asset(
                      widget.companyLogo,
                      width: 50,
                      height: 50,
                      // Add your image loading placeholders or error widgets here
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    child: Column(children: [
                      Text(
                        widget.companyName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.personName,
                        style: const TextStyle(fontWeight: null),
                      ),
                    ]),
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                        color: isFavorited ? Colors.red : null,
                      ),
                      child: Icon(Icons.favorite_outlined,
                          color: isFavorited ? Colors.white : null),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isOnline ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          // Text(
          //   'Person: $personName',
          // ),
          const Divider(),
          Text(
            widget.placeName,
            style: const TextStyle(
                fontWeight: null, fontSize: 20, color: Colors.grey),
          ),
          Text(
            widget.moneyName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
          ),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(148, 108, 195, 1),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'ONLINE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomBox extends StatefulWidget {
//   final String? companyLogo;
//   final String? companyName;
//   final String? personName;
//   final String? placeName;
//   final String? moneyName;
//   final bool isOnline;
//   // final VoidCallback onFavIconPressed;

//   const CustomBox({
//     this.companyLogo,
//     this.companyName,
//     this.personName,
//     this.placeName,
//     this.moneyName,
//     required this.isOnline,
//     // required this.onFavIconPressed,
//   });

//   @override
//   State<CustomBox> createState() => _CustomBoxState();
// }

// class _CustomBoxState extends State<CustomBox> {
//   bool isFavorited = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10.0),
//       margin: const EdgeInsets.all(9),
//       height: 230,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(width: 1),
//                       borderRadius: BorderRadius.circular(9),
//                     ),
//                     child: widget.companyLogo != null
//                         ? Image.asset(
//                             widget.companyLogo!,
//                             width: 50,
//                             height: 50,
//                           )
//                         : Placeholder(), // Placeholder if no image provided
//                   ),
//                   const SizedBox(width: 8.0),
//                   Container(
//                     child: Column(
//                       children: [
//                         Text(
//                           widget.companyName ?? '',
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           widget.personName ?? '',
//                           style: const TextStyle(fontWeight: null),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isFavorited = !isFavorited;
//                   });
//                   // widget.onFavIconPressed();
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8.0),
//                     color: isFavorited ? Colors.red : null,
//                   ),
//                   child: Icon(
//                     Icons.favorite_outlined,
//                     color: isFavorited ? Colors.white : null,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               Container(
//                 width: 20,
//                 height: 20,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: widget.isOnline ? Colors.green : Colors.red,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8.0),
//           Divider(),
//           Text(
//             widget.placeName ?? '',
//             style: const TextStyle(
//               fontWeight: null,
//               fontSize: 20,
//               color: Colors.grey,
//             ),
//           ),
//           Text(
//             widget.moneyName ?? '',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.blue,
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   color: const Color.fromRGBO(148, 108, 195, 1),
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: const Text(
//                   'ONLINE',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intershipapp/models/courses.dart';
// import 'package:intershipapp/utilities.dart';
// import 'package:intershipapp/jobdis.dart';
// import 'package:intershipapp/screen/Home.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: returnButton(
//               'assets/vectornormal.png',
//               const Color.fromARGB(34, 104, 104, 104),
//               26.0,
//               26.0,
//               context,
//               Home()),
//           // const SizedBox(
//           //   width: 115,
//         ),
//         body: CustomBox(),
//       ),
//     );
//   }
// }

// class CompanyDataScreen extends StatefulWidget {
//   @override
//   _CompanyDataScreenState createState() => _CompanyDataScreenState();
// }

// class _CompanyDataScreenState extends State<CompanyDataScreen> {
//   Future<List<dynamic>?> fetchData() async {
//     final response = await http
//         .get(Uri.parse('https://workshala-7v7q.onrender.com/companyData'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> decodedData = json.decode(response.body);

//       if (decodedData.containsKey("companies")) {
//         return decodedData["companies"];
//       } else {
//         throw Exception('Invalid data format - missing "companies" key');
//       }
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>?>(
//       future: fetchData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else {
//           List<dynamic>? companyData = snapshot.data;

//           return ListView.builder(
//             itemCount: companyData?.length ?? 0,
//             itemBuilder: (context, index) {
//               if (companyData == null) {
//                 return Container(); // or any other placeholder widget
//               }

//               return Container(
//                 margin: EdgeInsets.all(8.0),
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.network(
//                       companyData[index]['img'],
//                       width: 100.0, // Adjust the size as needed
//                       height: 100.0,
//                       fit: BoxFit.cover,
//                     ),
//                     Text('Company Name: ${companyData[index]['title']}'),
//                     Text('Location: ${companyData[index]['location']}'),
//                     Text('Industry: ${companyData[index]['industry']}'),
//                     Text('Company Type: ${companyData[index]['companyType']}'),
//                     Text('about: ${companyData[index]['about']}')
//                     // Add more fields as needed
//                   ],
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

class CustomBox extends StatefulWidget {
  const CustomBox({super.key});

  // const CustomBox({super.key});
  @override
  State<CustomBox> createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Text('Your Title Here'), // Replace with your desired title
      ),
      body: CustomDetail(),
    );
  }
}

class CustomDetail extends StatelessWidget {
  CustomDetail({super.key});
  bool isFavorited = false;
  Future<List<dynamic>?> fetchData() async {
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic>? companyData = snapshot.data;

            // return Center(
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //       const SizedBox(
            //         height: 30,
            //       ),
            //       Container(
            //           child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           const SizedBox(
            //             width: 30,
            //           ),
            //           returnButton(
            //               'assets/vectornormal.png',
            //               const Color.fromARGB(34, 104, 104, 104),
            //               26.0,
            //               26.0,
            //               context,
            //               Home()),
            //           const SizedBox(
            //             width: 115,
            //           ),
            //           // const Text(
            //           //   'Details',
            //           //   style: TextStyle(
            //           //       fontWeight: FontWeight.bold,
            //           //       fontSize: 28,
            //           //       color: Color.fromARGB(255, 0, 0, 0)),
            //           // ),
            //           const SizedBox(width: 150),
            //           returnButton1(
            //               'assets/share.png',
            //               const Color.fromARGB(34, 104, 104, 104),
            //               28.0,
            //               28.0,
            //               context,
            //               const jobDisPage()),
            //         ],
            //       )),
            return ListView.builder(
                itemCount: companyData?.length ?? 0,
                itemBuilder: (context, index) {
                  if (companyData == null) {
                    return Container(); // or any other placeholder widget
                  }
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(9),
                    height: 230,
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
                                    // child: widget.companyLogo != null
                                    child: Image.network(
                                      companyData[index]['img'],
                                      width: 90.0, // Adjust the size as needed
                                      height: 85.0,
                                      scale: 8.0,
                                      // fit: BoxFit.cover,
                                    )
                                    // : Placeholder(), // Placeholder if no image provided
                                    ),
                                const SizedBox(width: 8.0),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Company name: ${companyData[index]['title']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Company Type: ${companyData[index]['companyType']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   isFavorited = !isFavorited;
                                // });
                                // widget.onFavIconPressed();
                              },
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
                            // Container(
                            //   width: 20,
                            //   height: 20,
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     color: Colors.green,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        const Divider(),
                        Text(
                          'Location: ${companyData[index]['location']}',
                          style: const TextStyle(
                            fontWeight: null,
                            fontSize: 16,
                            color: Color(0xD6595961),
                          ),
                        ),
                        Text(
                          'Industry: ${companyData[index]['industry']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF246BFD),
                          ),
                        ),
                        const SizedBox(
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
                            const SizedBox(
                              width: 195.0,
                            ),
                            const Text(
                              'View Details',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF246BFD),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                // height: 0,
                                // letterSpacing: -0.30,
                              ),
                            )
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
  




// class CourseBox extends StatefulWidget {
//   // final String? companyLogo;
//   // final String? companyName;
//   // final String? personName;
//   // final String? placeName;
//   // final String? moneyName;
//   // final bool isOnline;
//   // // final VoidCallback onFavIconPressed;

//   // const CourseBox({
//   //   this.companyLogo,
//   //   this.companyName,
//   //   this.personName,
//   //   this.placeName,
//   //   this.moneyName,
//   //   required this.isOnline,
//   //   // required this.onFavIconPressed,
//   // });

//   //  Future<List<dynamic>?> fetchData() async {
//   //   final response = await http.get(Uri.parse('https://workshala-7v7q.onrender.com/companyData'));

//   //   if (response.statusCode == 200) {
//   //     final Map<String, dynamic> decodedData = json.decode(response.body);

//   //     if (decodedData.containsKey("companies")) {
//   //       return decodedData["companies"];
//   //     } else {
//   //       throw Exception('Invalid data format - missing "companies" key');
//   //     }
//   //   } else {
//   //     throw Exception('Failed to load data');
//   //   }
//   // }

//   @override
//   State<CourseBox> createState() => _CourseBoxState();
// }

// class _CourseBoxState extends State<CourseBox> {
//   bool isFavorited = false;
//   Future<List<dynamic>?> fetchData() async {
//     final response = await http
//         .get(Uri.parse('https://course2.onrender.com/recommend/flutter'));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> decodedData = json.decode(response.body);

//       if (decodedData.containsKey("courses")) {
//         return decodedData["courses"];
//       } else {
//         throw Exception('Invalid data format - missing "courses" key');
//       }
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>?>(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<dynamic>? companyData = snapshot.data;

//             return ListView.builder(
//                 itemCount: Courses?.length ?? 0,
//                 itemBuilder: (context, index) {
//                   if (companyData == null) {
//                     return Container(); // or any other placeholder widget
//                   }
//                   return Container(
//                     padding: const EdgeInsets.all(10.0),
//                     margin: const EdgeInsets.all(9),
//                     height: 230,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(width: 1),
//                                       borderRadius: BorderRadius.circular(9),
//                                     ),
//                                     // child: widget.companyLogo != null
//                                     child: Image.network(
//                                       companyData[index]['img'],
//                                       width: 90.0, // Adjust the size as needed
//                                       height: 85.0,
//                                       scale: 8.0,
//                                       // fit: BoxFit.cover,
//                                     )
//                                     // : Placeholder(), // Placeholder if no image provided
//                                     ),
//                                 const SizedBox(width: 8.0),
//                                 Container(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Company name: ${companyData[index]['title']}',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 12,
//                                             color: Colors.black),
//                                       ),
//                                       Text(
//                                         'Company Type: ${companyData[index]['companyType']}',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 12,
//                                             color: Colors.black),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   isFavorited = !isFavorited;
//                                 });
//                                 // widget.onFavIconPressed();
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.grey),
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   color: isFavorited ? Colors.red : null,
//                                 ),
//                                 child: Icon(
//                                   Icons.favorite_outlined,
//                                   color: isFavorited ? Colors.white : null,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 8.0),
//                             // Container(
//                             //   width: 20,
//                             //   height: 20,
//                             //   decoration: BoxDecoration(
//                             //     shape: BoxShape.circle,
//                             //     color: Colors.green,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                         const SizedBox(height: 8.0),
//                         Divider(),
//                         Text(
//                           'Place Name: ${companyData[index]['location']}',
//                           style: const TextStyle(
//                             fontWeight: null,
//                             fontSize: 16,
//                             color: Color(0xD6595961),
//                           ),
//                         ),
//                         Text(
//                           'Industry: ${companyData[index]['industry']}',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Color(0xFF246BFD),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5.0,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               // height: 20.0,
//                               padding: const EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                 color: const Color.fromRGBO(148, 108, 195, 1),
//                                 border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               child: const Text(
//                                 'ONLINE',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 195.0,
//                             ),
//                             Text(
//                               'View Details',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color(0xFF246BFD),
//                                 fontSize: 13,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                                 // height: 0,
//                                 // letterSpacing: -0.30,
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           }
//         });
//   }
// }
