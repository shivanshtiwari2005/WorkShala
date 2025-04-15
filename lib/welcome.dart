// import 'package:flutter/material.dart';
// import 'package:intershipapp/screen/login.dart';
// // import 'package:workshala/ProfileScreen.dart';
// // import 'package:workshala/splashscreen.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               height: 390,
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                 color: Color(0xffFFFFFF),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(42),
//                     bottomRight: Radius.circular(42)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xff946CC3).withOpacity(0.45), // Shadow color
//                     spreadRadius: 3, // Spread radius
//                     blurRadius: 5, // Blur radius
//                     offset: Offset(0, 4), // Offset (horizontal, vertical)
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 90),
//                   Center(
//                       child: Image.asset(
//                           'assets/WhatsApp Image 2023-11-18 at 19.42.37_16844992.jpg')),
//                 ],
//               ),
//             ),
//             SizedBox(height: 69),
//             Text("Welcome to ",
//                 style: TextStyle(
//                   color: Color(0xff000000),
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 32,
//                 )),
//             SizedBox(height: 30),
//             RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "WORK",
//                       style: TextStyle(
//                           color: Color(0xff946CC3),
//                           fontSize: 42,
//                           fontFamily: 'Azonix'),
//                     ),
//                     TextSpan(
//                       text: "SHALA",
//                       style: TextStyle(
//                           color: Color(0xff000000),
//                           fontSize: 42,
//                           fontFamily: 'Azonix'),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.left),
//             SizedBox(height: 72),
//             Container(
//               height: 9,
//               width: 45,
//               decoration: BoxDecoration(
//                 color: Color(0xff946CC3).withOpacity(0.79),
//                 borderRadius: BorderRadius.all(Radius.circular(50)),
//               ),
//             ),
//             SizedBox(
//               height: 39,
//             ),
//             SizedBox(
//               height: 60,
//               width: 352,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Login()));
//                 },
//                 child: Text(
//                   'Next',
//                   style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Inter'),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xff946CC3),
//                   onPrimary: Colors.white,
//                   onSurface: Colors.grey,
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intershipapp/screen/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: screenHeight * 0.52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff946CC3).withOpacity(0.45),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    Image.asset(
                      'assets/WhatsApp Image 2023-11-18 at 19.42.37_16844992.jpg',
                      height: screenHeight * 0.4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              Text(
                "Welcome to ",
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.08,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "WORK",
                      style: TextStyle(
                        color: const Color(0xff946CC3),
                        fontSize: screenWidth * 0.1,
                        fontFamily: 'Azonix',
                      ),
                    ),
                    TextSpan(
                      text: "SHALA",
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: screenWidth * 0.1,
                        fontFamily: 'Azonix',
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.07),
              Container(
                height: screenHeight * 0.015,
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                  color: const Color(0xff946CC3).withOpacity(0.79),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                height: screenHeight * 0.09,
                width: screenWidth * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff946CC3),
                    disabledForegroundColor: Colors.grey.withOpacity(0.38),
                    disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
