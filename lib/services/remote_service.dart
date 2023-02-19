import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizapp/models/questions.dart';

class RemoteServices{
  Future<List<Questions>?> fetchData(int limit, {String extra = ""})async{
    if(limit<1) return null;
    var response = await http.get(Uri.parse("https://the-trivia-api.com/api/questions?limit=10$extra"));

    debugPrint("https://the-trivia-api.com/api/questions?limit=10$extra");

    if(response.statusCode == 200){
      try {
        return questionsFromJson(response.body);
      } catch (e) {
        return fetchData(limit-1);
      }
    }else{
      // print("Error: Data not found!");
    }
    return null;
  }
}