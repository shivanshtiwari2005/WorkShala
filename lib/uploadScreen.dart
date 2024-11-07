import 'package:flutter/material.dart';
import 'package:intershipapp/jobdis.dart';
import 'package:intershipapp/uploading.dart';
import 'package:intershipapp/utilities.dart';
// import 'package:workshala/loadingpage.dart';
// import 'package:workshala/utilities.dart';
// import 'package:workshala/jobdis.dart';

class uploadPage extends StatefulWidget {
  const uploadPage({super.key});

  @override
  State<uploadPage> createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: uploadScreen(),
    );
  }
}

class uploadScreen extends StatelessWidget {
  const uploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(height: screenHeight * 0.08),
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 16,
          ),
          returnButton(
              'assets/vectornormal.png',
              const Color.fromARGB(34, 104, 104, 104),
              26.0,
              26.0,
              context,
              const jobDisPage()),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'Details',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
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
      SizedBox(height: screenHeight * 0.08),
      returnButton('assets/upload.png', const Color(0xFF8D8D8D), 65.0, 145.0,
          null, null),
      SizedBox(height: screenHeight * 0.008),
      const Text('Upload Resume/CV',
          style: TextStyle(
            color: Color(0xFF8D8D8D),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0.09,
          )),
      SizedBox(height: screenHeight * 0.12),
      applyButtonBox('Upload CV', 171.0, 50.0, context, const uploadingPage()),
    ]));
  }
}
