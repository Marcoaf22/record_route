// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:record_route/main.controller.dart';

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<MainController>(
//       builder: (_) {
//         return Scaffold(
//           appBar: AppBar(title: Text('')),
//           body: ListView(
//             children: List.generate(_.positions.length, (index) {
//               return ListTile(
//                 title:
//                     Text({index + 1}.toString() + ' :: ' + _.positions[index]),
//               );
//             }),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               // _.determinePosition();
//               // _.initLocation();
//               _.updateLoction();
//             },
//             child: Text('Button'),
//           ),
//         );
//       },
//       init: MainController(),
//     );
//   }
// }
