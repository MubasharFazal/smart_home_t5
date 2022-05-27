import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String urlImage;
  final String email;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.urlImage,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Text(name),
        centerTitle: true,
      ),
      body: Image.network(
        urlImage,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
