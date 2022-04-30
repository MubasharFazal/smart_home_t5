import 'package:flutter/material.dart';
import 'package:smart_home/Pages/home_page/desktop_layout.dart';
import 'package:smart_home/Pages/home_page/mobile_layout.dart';
import 'package:smart_home/services/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final CurrentWidth = MediaQuery.of(context).size.width;
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MyMobileBody(), desktopBody: MyDesktopBody()),
    );
  }
}
