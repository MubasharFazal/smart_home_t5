import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/Pages/login_page/login_page.dart';
import 'package:smart_home/Pages/profile_page/profile_page.dart';

class MenuDashboardPage extends StatefulWidget {
  const MenuDashboardPage({Key? key}) : super(key: key);

  @override
  State<MenuDashboardPage> createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    const name = 'Sarah Abs';
    const email = 'sarah@abs.com';
    const urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      backgroundColor: Colors.deepPurple[400],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildHeader(
            urlImage: urlImage,
            name: name,
            email: email,
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfilePage(
                name: 'Sarah Abs',
                email: 'sarah@abs.com',
                urlImage: urlImage,
              ),
            )),
          ),

          // const DrawerHeader(
          //   // child: Text(
          //   //   'Side menu',
          //   //   style: TextStyle(color: Colors.white, fontSize: 25),
          //   // ),

          //   decoration: BoxDecoration(
          //       // color: Colors.deepPurple,
          //       // image: DecorationImage(
          //       //     fit: BoxFit.fill,
          //       //     image: AssetImage(''))
          //       ),
          // ),
          ListTile(
            leading: const Icon(
              Icons.input,
              color: Colors.white,
            ),
            title: const Text('Item 1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('closed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 40, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
