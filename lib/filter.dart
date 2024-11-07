import 'package:flutter/material.dart';
// import 'package:workshala/loadingpage.dart';
// import 'package:workshala/utilities.dart';
// import 'package:workshala/jobdis.dart';
// import 'package:workshala/loadingpage.dart';

class filterPage extends StatefulWidget {
  const filterPage({super.key});

  @override
  State<filterPage> createState() => _filterPageState();
}

class _filterPageState extends State<filterPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: filterScreen(),
    );
  }
}

class filterScreen extends StatelessWidget {
  const filterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        height: 45,
      ),
    ]));
  }
}
