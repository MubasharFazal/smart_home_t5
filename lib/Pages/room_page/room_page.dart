import 'package:flutter/material.dart';
import 'package:smart_home/database/gateway.dart';
import 'package:smart_home/widgets/drawer_dashboard.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  void showdialog() {
    GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add New Room"),
            content: SizedBox(
              height: 150,
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: titleController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        titleController.text = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.room_preferences_outlined),
                        labelText: "Room Title",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        descriptionController.text = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.design_services_outlined),
                        labelText: "Room Description",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    dailySpecialref.push().set({
                      'value': titleController.text,
                      'des': descriptionController.text
                    }).then((value) => print("this object is added"));
                    titleController.clear();
                    descriptionController.clear();
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerDashboard(),
      floatingActionButton: FloatingActionButton(
        onPressed: showdialog,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  lightDatabase.set({
                    'status': 'true',
                  });
                },
                child: const Text('true')),
            ElevatedButton(
                onPressed: () {
                  lightDatabase.set({
                    'status': 'false',
                  });
                },
                child: const Text('false')),
          ],
        ),
      ),
    );
  }
}
