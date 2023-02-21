import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/utils/constants.dart';

class EndPage extends StatelessWidget {
  final int point;
  final String extra;
  const EndPage(
    String this.extra, {
    super.key,
    required this.point,
  });

  String getInfo() {
    String txt = extra
        .replaceAll("&c", "C")
        .replaceAll("=", ": ")
        .replaceAll(",", ", ")
        .replaceAll("&d", "\n\nD")
        .replaceAll("_and_", " & "). toUpperCase();

    return txt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Scored $point out of 10",
            textAlign: TextAlign.center,
            style: GoogleFonts.abel(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              getInfo(),
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: colorBtn,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Text(
                "Go Back!",
                style: GoogleFonts.abel(
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
