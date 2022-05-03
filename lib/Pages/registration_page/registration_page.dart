import 'package:flutter/material.dart';
import 'package:smart_home/Pages/registration_page/registration.desktop.dart';
import 'package:smart_home/Pages/registration_page/registration_mobile.dart';
import 'package:smart_home/services/responsive.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: RegistrationMobile(), desktopBody: RegistrationDesktop()),
    );
  }
}
