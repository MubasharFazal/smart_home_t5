import 'package:flutter/material.dart';
import 'package:smart_home/services/dimesions.dart';

class ResponsiveLayout extends StatelessWidget {
  // const ResponsiveLayout({Key? key}) : super(key: key);
  final Widget mobileBody;
  final Widget desktopBody;

  const ResponsiveLayout({required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobilewidth) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
