import 'package:firebase_database/firebase_database.dart';

final firebasedatabase = FirebaseDatabase.instance.reference();

//
final dailySpecialref = firebasedatabase.child('check/');

final lightDatabase = firebasedatabase.child('light1/');

final fanDatabase = firebasedatabase.child('fan1/');
