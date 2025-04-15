import 'package:flutter/material.dart';
import 'package:intershipapp/uploading.dart';
import 'package:intershipapp/utilities.dart';
// import 'package:workshala/loadingpage.dart';
// import 'package:workshala/utilities.dart';
// import 'package:workshala/jobdis.dart';
// import 'package:workshala/loadingpage.dart';

class uploadedPage extends StatefulWidget {
  const uploadedPage({super.key});

  @override
  State<uploadedPage> createState() => _uploadedPageState();
}

class _uploadedPageState extends State<uploadedPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: uploadedScreen(),
    );
  }
}

class uploadedScreen extends StatelessWidget {
  const uploadedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        height: screenHeight * 0.045,
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
              26.0,
              26.0,
              context,
              const uploadingPage()),
          const SizedBox(
            width: 18,
          ),
          const Text(
            'Details',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
                fontFamily: 'Raleway',
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
      Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(
              height: screenHeight * 0.036,
            ),
            resumeBox(
                'assets/pdf.png', 60.0, 200.0, 'Rohit khatri.pdf', '540kb'),
            SizedBox(
              height: screenHeight * 0.016,
            ),
            const Text('         Successful',
                style: TextStyle(
                  color: Color(0xFF0093FF),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(
              height: screenHeight * 0.016,
            ),
            const Text(
                '   You have successfully applied to this internship.\nyou can see the status in the “applications” section.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ))
          ])),

      SizedBox(
        height: screenHeight * 0.095,
      ),
      // applyButtonBox('Cancel', 171.0, 50.0, null, null),
      requiredBox(280.0, 45.0, 'Discover more'),
    ]));
  }
}
