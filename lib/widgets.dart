// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

text(text, fontSize, fontWeight, color, fontStyle) {
  return Text(text,
      //textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Mali',
          fontStyle: fontStyle));
}

textParagraph(text, fontSize, fontWeight, color, fontStyle) {
  return Text(text,
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Mali',
          fontStyle: fontStyle));
}

button(t, context, route) {
  return ElevatedButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      child: t);
}

// Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(30)),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: <Color>[
//             Color(0xffee0000),
//             Color(0xffeeee00),
//           ],
//           tileMode: TileMode.repeated,
//         ),
//       ),
//       child: t,
//     ),