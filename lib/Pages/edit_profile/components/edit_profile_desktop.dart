import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:smart_home/Pages/edit_profile/components/image_picker.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/models/user_model.dart.dart';

class EditProfileDesktop extends StatefulWidget {
  const EditProfileDesktop({Key? key}) : super(key: key);

  @override
  State<EditProfileDesktop> createState() => _EditProfileDesktopState();
}

class _EditProfileDesktopState extends State<EditProfileDesktop> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 800,
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            // top: getProportionateScreenHeight(15),
            right: getProportionateScreenWidth(20),
            bottom: getProportionateScreenHeight(15),
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, right: 7),
                child: Row(
                  children: [
                    const Text(
                      'Edit Profile',
                      // style: Theme.of(context).textTheme.headline1,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Center(
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color(0xFFBDBDBD).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(15),
                    top: getProportionateScreenHeight(15),
                    right: getProportionateScreenWidth(15),
                    bottom: getProportionateScreenHeight(40),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Upload image',
                        // style: Theme.of(context).textTheme.headline1,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        dashPattern: const [7, 7],
                        color: Colors.black38,
                        strokeWidth: 2,
                        // padding: EdgeInsets.fromLTRB(115, 37, 115, 37),
                        padding: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(75),
                            getProportionateScreenHeight(25),
                            getProportionateScreenWidth(75),
                            getProportionateScreenHeight(25)),
                        child: const UploadImage(),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      autofocus: false,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                        hintText: loggedInUser.firstName ?? 'First Name',

                        hintStyle: const TextStyle(color: Colors.grey),
                        icon: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        // prefixIcon: Icon(Icons.person, size: 25, color: Colors.grey,),
                        // contentPadding: EdgeInsets.only(left: 30),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        enabled: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: usernameController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                        hintText: loggedInUser.secondName ?? 'Last Name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        icon: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        enabled: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                        hintText: loggedInUser.email ?? 'abc@smart.com',
                        hintStyle: const TextStyle(color: Colors.grey),
                        icon: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabled: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: phoneController,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return 'Phone no. is required';
                        }
                        return null;
                      },
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                        hintText: loggedInUser.phone ?? '0300 1234567',
                        hintStyle: const TextStyle(color: Colors.grey),
                        icon: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        enabled: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                height: getProportionateScreenHeight(40),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: InkWell(
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      print("data uploaded");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
