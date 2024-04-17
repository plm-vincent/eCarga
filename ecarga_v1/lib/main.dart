import 'package:ecarga_v1/Pages/Auth/login.dart';
import 'package:ecarga_v1/Pages/loadingscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(eCargaMain());
}

class eCargaMain extends StatelessWidget {
  const eCargaMain({Key? key}) : super(key: key);

// eto yung original tropa
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(
        key: Key('LoadingScreen'),
      ),
    );
  }
}

// eto yung original tropa
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
//       home: LoadingScreen(
//         key: Key('LoadingScreen'), // Pass a Key to LoadingScreen
//       ),
//     );
//   }
// }