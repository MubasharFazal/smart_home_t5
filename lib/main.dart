import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:smart_home/Pages/signin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  void signup() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: "web11@gmail.com", password: "123456");
    } catch (e) {
      // print(e);
      debugPrint('debug: $e');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInPage());
  }
}

// Scaffold(
//         appBar: AppBar(
//           title: const Text("data"),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             child: const Text('Button'),
//             onPressed: () {
//               signup();
//             },
//             style: ElevatedButton.styleFrom(
//                 primary: const Color.fromARGB(255, 93, 162, 231),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                 textStyle:
//                     const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//           ),
//         ),
//       ),