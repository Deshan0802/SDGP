// import 'package:flutter/material.dart';

// class newBackButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigate back to the previous screen
//         Navigator.of(context).pop();
//       },
//       child: Container(
//         width: 30.0,
//         height: 30.0,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.blue.shade400,
//         ),
//         child: Icon(
//           Icons.arrow_back_ios_new_sharp,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

// class newInfoButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Icon(
//       Icons.info,
//       color: Colors.blue.shade400,
//       size: 40.0,
//     );
//   }
// }

// class newHeader extends StatelessWidget {
//   final String headerTextInfo;
//   final String headerText;

//   newHeader({
//     required this.headerTextInfo,
//     required this.headerText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             newBackButton(),
//             newInfoButton(),
//           ],
//         ),
//         Column(
//           children: [
//             Text(
//               headerTextInfo,
//               style: TextStyle(fontSize: 10.0, color: Colors.grey),
//             ),
//             Text(
//               headerText,
//               style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Divider(
//               color: Colors.grey.shade700,
//               thickness: 1.0,
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
