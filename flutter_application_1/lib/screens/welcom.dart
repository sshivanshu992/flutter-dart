import 'package:flutter/material.dart';

// class Welcome extends StatelessWidget {
//   const Welcome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(colors: [
//           Colors.lightBlue,
//           // Colors.blueGrey,
//           Colors.lightBlueAccent,
//         ]),
//       ),
//       child: const Center(
//         child: Text(
//           'Your Welcome to My First Flutter App how to handle the overflow',
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.white70,
//           ),
//         ),
//       ),
//     );
//   }
// }

///update version here-------------------------------------------------------------------

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.lightBlue,
          // Colors.blueGrey,
          Colors.lightBlueAccent,
        ]),
      ),
      child: const Center(
        child: Text.rich(
          TextSpan(
              text: 'shivanshu -> ',
              style: TextStyle(fontSize: 25),
              children: [
                TextSpan(
                  text: '[ Code, ',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextSpan(
                  text: 'Himalaya ]',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
