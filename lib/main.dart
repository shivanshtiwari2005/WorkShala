import 'package:flutter/material.dart';
import 'package:intershipapp/filter.dart';
import 'package:intershipapp/screen/FilterpageScreen.dart';
import 'package:intershipapp/screen/Home.dart';
import 'package:intershipapp/screen/Login.dart';
import 'package:intershipapp/screen/Register.dart';
import 'package:intershipapp/jobdis.dart';
import 'package:intershipapp/loadingpage.dart';
import 'package:intershipapp/screen/ForgetPassword.dart';
// import 'package:tic_tac_toe1/homePage.dart';
// import 'package:workshala/loadingpage.dart';
// import 'package:workshala/jobdis.dart';
// import 'package:workshala/uploadScreen.dart';
// import 'package:workshala/uploading.dart';
// import 'package:workshala/uploaded.dart';
import 'package:intershipapp/screen/Home.dart';
import 'package:intershipapp/screen/Login.dart';
import 'package:intershipapp/screen/MainScreen.dart';
import 'package:intershipapp/screen/NewPassword.dart';
import 'package:intershipapp/screen/Profile.dart';
import 'package:intershipapp/screen/Settings.dart';
import 'package:intershipapp/splashscreen.dart';
import 'package:intershipapp/uploadScreen.dart';
import 'package:intershipapp/uploaded.dart';
import 'package:intershipapp/uploading.dart';
import 'package:intershipapp/widgets/courseRec.dart';
// import 'package:intershipapp/screen/ProfileLogin.dart';
import 'package:intershipapp/widgets/jobcontainer.dart';

void main() {
  runApp(const MyApp());
}

// asdfghjkl;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}
