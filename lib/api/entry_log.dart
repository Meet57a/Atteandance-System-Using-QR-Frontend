// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:http/http.dart' as http;

class EntryLog {
  static bool exitTimes = false;
  static void entryLog(id, token, type, context) async {
    try {
      var body = {
        "studentId": id,
        "type": type,
      };

      var response = await http.post(
        Uri.parse(entryLogUrl),
        headers: {
          "Content-Type": "application/json",
          'Authorization': '$token',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        if (type == "entry") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Successfully Entered"),
              duration: const Duration(seconds: 1),
              elevation: 10,
              backgroundColor: Colors.blueGrey,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(5),
            ),
          );
        } else if (type == "exit") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Successfully Exited"),
              duration: const Duration(seconds: 1),
              elevation: 10,
              backgroundColor: Colors.blueGrey,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(5),
            ),
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static void getEntryLogs(studentId, token) async {
    try {
      var res = await http.get(
        Uri.parse("${url}staff/entry-logs/$studentId"),
        headers: {"Authorization": token},
      );

      if (res.statusCode == 200) {
        var jsonDecooded = jsonDecode(res.body);
        var jsonData = jsonDecooded['data'];
        var jsonLatestEntryLog = jsonData['isEntred'];
        exitTimes = jsonLatestEntryLog;
        print(jsonLatestEntryLog);
      }
    } catch (e) {
      print(e);
    }
  }
}
