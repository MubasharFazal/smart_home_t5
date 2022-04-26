import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:smart_home/Pages/home_page.dart';
import 'package:smart_home/Pages/signin_page.dart';
import 'package:smart_home/services/auth_servce.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
              const SizedBox(
                height: 20,
              ),
              buttonItem("assets/images/google.svg", "Continue with Google", 25,
                  () async {
                await authClass.googleSignIn(context);
              }),
              const SizedBox(
                height: 15,
              ),
              buttonItem(
                  "assets/images/phone.svg", "Continue with Phone", 30, () {}),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Or",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              textItem("Email", _emailController, false),
              const SizedBox(
                height: 15,
              ),
              textItem("Password", _passwordController, true),
              const SizedBox(
                height: 30,
              ),
              colorbutton(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "If you already have an account? ",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget colorbutton() {
    return InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        try {
          firebase_auth.UserCredential userCredential =
              await firebaseAuth.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);
          print(userCredential.user?.email);
          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => const HomePage()),
              (route) => false);
          // ignore: avoid_print

        } catch (e) {
          final snackBar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Color(0xfffd746c),
              Color(0xffff9068),
              Color(0xfffd746c)
            ])),
        child: Center(
          child: circular
              ? const CircularProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const SignInPage()),
                        (route) => false);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
        ),
      ),
    );
  }

  Widget buttonItem(
      String imagepath, String bottemName, double size, Function() ontap) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 60,
        height: 60,
        child: Card(
          color: Colors.black,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagepath,
                height: size,
                width: size,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                bottemName,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(
      String labeltext, TextEditingController controller, bool obscureText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 17, color: Colors.lightBlue),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: const TextStyle(
              fontSize: 17, color: Colors.lightBlue), //textStyle
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1.5, color: Colors.yellow),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
