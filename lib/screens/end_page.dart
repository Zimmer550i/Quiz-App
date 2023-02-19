import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/utils/constants.dart';

class EndPage extends StatelessWidget {
  final int point;
  const EndPage({
    super.key,
    required this.point,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 6),
            child: SvgPicture.asset(
              "assets/logo.svg",
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Text(
            "Solved $point out of 10",
            textAlign: TextAlign.center,
            style: GoogleFonts.abel(
              fontSize: 29,
            ),
          ),
          const SizedBox(
            height: 50,
            width: double.infinity,
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
