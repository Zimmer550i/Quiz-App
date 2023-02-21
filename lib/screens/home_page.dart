import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/screens/quiz_page.dart';
import 'package:quizapp/services/remote_service.dart';
import 'package:quizapp/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Questions>? questions;
  bool isLoadind = false;
  String? difficulty = "easy";
  List<String> options = [
    "Arts & Literature",
    "Film & TV",
    "Food & Drink",
    "General Knowledge",
    "Geography",
    "History",
    "Music",
    "Science",
    "Society & Culture",
    "Sport & Leisure",
  ];

  List<bool> values = List.filled(10, false);

  void getData() async {
    String extra = "&categories=";
    for (int i = 0; i < 10; i++) {
      if (values[i]) {
        extra += options[i].replaceAll(" & ", "_and_").toLowerCase();
        extra += ",";
      }
    }

    if (extra.endsWith(',')) {
      extra = extra.substring(0, extra.length - 1);
      debugPrint(extra);
    }

    if (difficulty != null) {
      extra += "&difficulty=";
      extra += difficulty!;
    }

    setState(() {
      isLoadind = true;
    });
    questions = await RemoteServices().fetchData(5, extra: extra);
    setState(() {
      isLoadind = false;
    });

    debugPrint(questions![0].category + questions![1].category);
    // await Future.delayed(const Duration(seconds: 2));

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            QuizPage(questions: questions!, questionsCount: 10, extra),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBG,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 6),
              child: SvgPicture.asset(
                "assets/logo.svg",
              ),
            ),
            Text(
              "Catagories:",
              style: GoogleFonts.abel(
                fontSize: 24,
              ),
            ),
            for (int i = 0; i < 10; i++)
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.height / 1.5,
                  maxHeight: MediaQuery.of(context).size.height / 18,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: values[i],
                      onChanged: (value) {
                        setState(() {
                          values[i] = value!;
                        });
                      },
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          values[i]= !values[i];
                        });
                      },
                      child: Text(
                        options[i],
                        style: GoogleFonts.abel(),
                      ),
                    ),
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Difficulty:  ",
                  style: GoogleFonts.abel(),
                ),
                DropdownButton(
                  alignment: Alignment.center,
                  elevation: 2,
                  dropdownColor: colorBG,
                  value: difficulty,
                  items: [
                    DropdownMenuItem(
                        value: "easy",
                        child: Text(
                          "Easy",
                          style: GoogleFonts.abel(),
                        )),
                    DropdownMenuItem(
                        value: "medium",
                        child: Text(
                          "Medium",
                          style: GoogleFonts.abel(),
                        )),
                    DropdownMenuItem(
                        value: "hard",
                        child: Text(
                          "Hard",
                          style: GoogleFonts.abel(),
                        )),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      difficulty = value;
                    });
                  },
                ),
              ],
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 18,
            // ),
            InkWell(
              onTap: () => getData(),
              child: Container(
                height: MediaQuery.of(context).size.height / 18,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: isLoadind
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Generate")),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
          ],
        ),
      ),
    );
  }
}
