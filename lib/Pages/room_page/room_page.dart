import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/widgets/drawer_dashboard.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final db = FirebaseFirestore.instance;
  late String title;
  late String description;

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
                      autofocus: true,
                      validator: (_value) {
                        if (_value == null || _value.isEmpty) {
                          return 'Where you want to install automation?';
                        }
                        return null;
                      },
                      onChanged: (_value) {
                        title = _value;
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
                      validator: (_value) {
                        if (_value == null) {
                          return 'What is room status?';
                        }
                        return null;
                      },
                      onChanged: (_value) {
                        description = _value;
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
                    if (_formkey.currentState!.validate()) {
                      db
                          .collection("rooms")
                          .add({'title': title, 'description': description});
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDashboardPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: showdialog,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('rooms').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('rooms'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const CircularProgressIndicator();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
