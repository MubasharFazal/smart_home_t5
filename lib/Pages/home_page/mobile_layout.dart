import 'package:flutter/material.dart';
import 'package:smart_home/widgets/drawer_dashboard.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDashboardPage(),
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: const Text('M O B I L E'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // youtube video
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.deepPurple[400],
                ),
              ),
            ),

            // comment section & recommended videos
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.deepPurple[300],
                      height: 120,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}




//   return Scaffold(
//       drawer: const MenuDashboardPage(),
//       appBar: AppBar(
//         title: const Text("Welcome"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 150,
//                 child:
//                     Image.asset("assets/images/logo.png", fit: BoxFit.contain),
//               ),
//               const Text(
//                 "Welcome Back",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text("UserName",
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   )),
//               const Text("Email",
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   )),
//               const SizedBox(
//                 height: 15,
//               ),
//               ActionChip(
//                   label: const Text("Logout"),
//                   onPressed: () {
//                     logout(context);
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // the logout function
//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const LoginPage()));
//   }
// }