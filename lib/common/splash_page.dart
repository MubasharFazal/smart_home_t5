// ignore_for_file: use_key_in_widget_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_home/Pages/login_page/login_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Image.asset("assets/images/mainlogo.png"),
      // child: FlutterLogo(size: MediaQuery.of(context).size.height)
    );
  }
}
