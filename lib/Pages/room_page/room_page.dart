import 'package:flutter/material.dart';
import 'package:smart_home/Pages/room_page/addroom_page.dart';
import 'package:smart_home/widgets/drawer_dashboard.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDashboardPage(),
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AddRoomPage()));
        },
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              height: 150,
              color: Colors.deepPurple[400],
            );
          }),
    );
  }
}
