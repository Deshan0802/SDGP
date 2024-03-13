// import 'package:flutter/material.dart';
// import 'package:front_end/screens/ReUsable.dart';
// import 'package:front_end/widgets/reusable.dart';

// class newTextToASL extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.all(10.0),
//         child: Column(children: [
//           newHeader(
//             headerTextInfo: 'Converts Input Text Into ASL',
//             headerText: 'Text To ASL',
//           ),
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
//               decoration: BoxDecoration(
//                   color: Colors.blue.shade400,
//                   borderRadius: BorderRadius.circular(20.0)),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(10.0),
//             // padding: EdgeInsets.all(10.0),
//             // decoration: BoxDecoration(
//             //   color: Colors.white,
//             //   borderRadius: BorderRadius.circular(20.0)
//             // ),
//             child: TextField(
//               maxLines: 1,
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10.0),
//             decoration: BoxDecoration(
//                 color: Colors.blue.shade400,
//                 borderRadius: BorderRadius.circular(20.0)),
//             child: InkWell(
//               onTap: () {},
//               child: Text(
//                 'Generate',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ]),
//       ),
//       bottomNavigationBar: CustomNavigationBar(),
//     );
//   }
// }
