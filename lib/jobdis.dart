import 'package:flutter/material.dart';
import 'package:intershipapp/models/companyData.dart';
import 'package:intershipapp/screen/Home.dart';
import 'package:intershipapp/services/companystatus.dart';
import 'package:intershipapp/uploadScreen.dart';
import 'package:intershipapp/utilities.dart';
// import 'package:workshala/loadingpage.dart';
// import 'package:workshala/utilities.dart';

class jobDisPage extends StatefulWidget {
  const jobDisPage({super.key});

  @override
  State<jobDisPage> createState() => _jobDisPageState();
}

class _jobDisPageState extends State<jobDisPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: jobDisDetail(),
        ));
  }
}

class jobDisDetail extends StatelessWidget {
  const jobDisDetail({super.key});
  @override
  Widget build(BuildContext context) {
    // CompanyServices companyServices = CompanyServices();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        height: screenHeight * 0.038,
      ),
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 30,
          ),
          returnButton(
              'assets/vectornormal.png',
              const Color.fromARGB(34, 104, 104, 104),
              26.0,
              26.0,
              context,
              Home()),
          const SizedBox(
            width: 115,
          ),
          const SizedBox(width: 150),
          returnButton1(
              'assets/share.png',
              const Color.fromARGB(34, 104, 104, 104),
              28.0,
              28.0,
              context,
              const jobDisPage()),
        ],
      )),
      Container(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 14, 13, 0),
              child: Column(children: [
                jobDisBoxUi(
                    context,
                    'assets/google1.png',
                    332.0,
                    340.0,
                    'UI/UX Designer',
                    'Google LLC',
                    'California, United States',
                    '\$10,000-\$25,000/month',
                    'Full Time',
                    'Onsite',
                    'Posted 10 Days ago, ends in 25 Dec.'),
              ]))),
      // Container(
      //     child: Padding(
      //         padding: EdgeInsets.fromLTRB(12, 14, 13, 0),
      //         child: TextColorChangeWithLine())),
      DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Text(
                    "Job Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    "Minimum Qualification",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: screenHeight * 0.29,
                  child: TabBarView(children: [
                    Container(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 14, 13, 0),
                            child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  const Text(
                                    'Job Description:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.008,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    SizedBox(
                                      height: screenHeight * 0.009,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ])),
                                  SizedBox(
                                    height: screenHeight * 0.0009,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    SizedBox(
                                      height: screenHeight * 0.009,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  SizedBox(
                                    height: screenHeight * 0.019,
                                  ),
                                  const Text(
                                    'Minimum Qualification:',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.019,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    SizedBox(
                                      height: screenHeight * 0.019,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  const Text(
                                    'Perks and Benefits:',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 17),
                                  const Text(
                                    'Required Skills:',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                      width: 300,
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 14, 13, 0),
                                          child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              // ),
                                              child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    requiredBox(173.16, 31.0,
                                                        'Creative Thinking'),
                                                    requiredBox(
                                                        97.16, 31.0, 'Figma'),
                                                    requiredBox(173.16, 31.0,
                                                        'Creative Thinking'),
                                                    requiredBox(
                                                        97.16, 31.0, 'Figma'),
                                                  ])))),
                                  SizedBox(
                                    height: screenHeight * 0.019,
                                  ),
                                  const Text(
                                    'About:',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Text(
                                    'Google LLC is an American multinational technology company that focuses on search engine technology, online advertising, cloud computing.. computer software, quantum computing. e- commerce, artificial intelligence, and consumer electronics',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.039,
                                  ),
                                  applyButtonBox('Apply', 320.0, 45.0, context,
                                      const uploadPage())
                                ])))),
                    Container(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 14, 13, 0),
                            child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  const Text(
                                    'Minimum Qualification:',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.019,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    SizedBox(
                                      height: screenHeight * 0.019,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                      child: Row(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Able to run design sprint to deliver the best user\nexperience based on research.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ])),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  const Text(
                                    'Perks and Benefits:',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 17),
                                  const Text(
                                    'Required Skills:',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                      width: 300,
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 14, 13, 0),
                                          child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              // ),
                                              child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    requiredBox(173.16, 31.0,
                                                        'Creative Thinking'),
                                                    requiredBox(
                                                        97.16, 31.0, 'Figma'),
                                                    requiredBox(173.16, 31.0,
                                                        'Creative Thinking'),
                                                    requiredBox(
                                                        97.16, 31.0, 'Figma'),
                                                  ])))),
                                  SizedBox(
                                    height: screenHeight * 0.019,
                                  ),
                                  const Text(
                                    'About:',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      // height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Text(
                                    'Google LLC is an American multinational technology company that focuses on search engine technology, online advertising, cloud computing.. computer software, quantum computing. e- commerce, artificial intelligence, and consumer electronics',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.039,
                                  ),
                                  applyButtonBox('Apply', 320.0, 45.0, context,
                                      const uploadPage())
                                ])))),

                    // SizedBox(
                    //   height: screenHeight * 0.039,
                    // ),
                    // applyButtonBox('Apply', 320.0, 45.0, context, const uploadPage()),
                  ]))
            ],
          ))
    ]));
  }
}
