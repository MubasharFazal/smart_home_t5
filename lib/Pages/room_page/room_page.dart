// RoomPage
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/database/appliencs_address.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  bool _testdate1 = false;
  String _testdate2 = "result goes here";
  String _testdate3 = "result goes here";
  String _testdate4 = "result goes here";

  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _activeListeners();
  }

  void _activeListeners() {
    _database.child(light1).child('status').onValue.listen((event) {
      final Object? stateOflight = event.snapshot.value;
      setState(() {
        String a = '$stateOflight';
        if (a == '0') {
          _testdate1 = true;
        } else {
          _testdate1 = false;
        }
      });
    });
    _database.child(light1).child('status').onValue.listen((event) {
      final Object? stateOflight = event.snapshot.value;
      setState(() {
        _testdate2 = '$stateOflight';
        if (_testdate2 == '0') {
          _testdate2 = 'ture';
        } else {
          _testdate2 = 'false';
        }
      });
    });
    _database.child(light1).child('status').onValue.listen((event) {
      final Object? stateOflight = event.snapshot.value;
      setState(() {
        _testdate3 = '$stateOflight';
        if (_testdate3 == '0') {
          _testdate3 = 'ture';
        } else {
          _testdate3 = 'false';
        }
      });
    });
    _database.child(light1).child('status').onValue.listen((event) {
      final Object? stateOflight = event.snapshot.value;
      setState(() {
        _testdate4 = '$stateOflight';
        if (_testdate4 == '0') {
          _testdate4 = 'ture';
        } else {
          _testdate4 = 'false';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_testdate1.toString()),
          Text(_testdate2),
          Text(_testdate3),
          Text(_testdate4),
        ],
      ),
    ));
  }
}











// import 'dart:ffi';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:smart_home/database/appliencs_address.dart';
// import 'package:smart_home/database/gateway.dart';
// import 'package:smart_home/widgets/drawer_dashboard.dart';

// class RoomPage extends StatefulWidget {
//   const RoomPage({Key? key}) : super(key: key);

//   @override
//   State<RoomPage> createState() => _RoomPageState();
// }

// class _RoomPageState extends State<RoomPage> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   void showdialog() {
//     GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    

//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text("Add New Room"),
//             content: SizedBox(
//               height: 150,
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       controller: titleController,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return ("Please Enter Your Email");
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         titleController.text = value!;
//                       },
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         icon: Icon(Icons.room_preferences_outlined),
//                         labelText: "Room Title",
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: descriptionController,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return ("Please Enter Your Email");
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         descriptionController.text = value!;
//                       },
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         icon: Icon(Icons.design_services_outlined),
//                         labelText: "Room Description",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               ElevatedButton(
//                   onPressed: () {
//                     // dailySpecialref.push().set({
//                     //   'value': titleController.text,
//                     //   'des': descriptionController.text
//                     // }).then((value) => print("this object is added"));
//                     titleController.clear();
//                     descriptionController.clear();
//                   },
//                   child: const Text("Add"))
//             ],
//           );
//         });
  
// }
// _activeLisner() {
//     _database.child(light1).child('status').onValue.listen((event) {});
//   }

//   @override
//   Void initState() {
//     super.initState();
//     _activeLisner();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const DrawerDashboard(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showdialog,
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         title: const Text("Rooms"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   lightDatabase1.set({
//                     'status': '1',
//                   });
//                 },
//                 child: const Text('1')),
//             ElevatedButton(
//                 onPressed: () {
//                   lightDatabase1.set({
//                     'status': '0',
//                   });
//                 },
//                 child: const Text('0')),
//           ],
//         ),
//       ),
//     );
//   }
// }
