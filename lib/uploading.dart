import 'package:flutter/material.dart';
import 'package:intershipapp/jobdis.dart';
import 'package:intershipapp/uploadScreen.dart';
import 'package:intershipapp/uploaded.dart';
import 'package:intershipapp/utilities.dart';
// import 'package:workshala/loadingpage.dart';
// import 'package:workshala/utilities.dart';
// import 'package:workshala/jobdis.dart';
// import 'package:workshala/loadingpage.dart';

class uploadingPage extends StatefulWidget {
  const uploadingPage({super.key});

  @override
  State<uploadingPage> createState() => _uploadingPageState();
}

class _uploadingPageState extends State<uploadingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: uploadingScreen(),
    );
  }
}

class uploadingScreen extends StatelessWidget {
  const uploadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        height: screenHeight * 0.039,
      ),
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
              28.0,
              28.0,
              context,
              const uploadPage()),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'Details',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
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
      const SizedBox(height: 33),
      Container(
          width: 334,
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: const Color(0xFF0A66C2),
                width: 2,
              )),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedLoadingDots(),
            Container(),
            SizedBox(
              height: screenHeight * 0.042,
            ),
            Text(
              'Uploading...',
              style: TextStyle(
                color: Color(0xFF0093FF),
                fontSize: 23,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0.05,
              ),
            ),
          ])),
      SizedBox(
        height: screenHeight * 0.08,
      ),
      applyButtonBox('Cancel', 171.0, 50.0, context, const uploadedPage()),
    ]));
  }
}
