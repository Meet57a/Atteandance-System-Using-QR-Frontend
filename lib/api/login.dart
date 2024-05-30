import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/constants/staffdata.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/screens/home_page.dart';
import 'package:frontend/screens/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static login(mobileNumber, password, context) async {
    final prefs = await SharedPreferences.getInstance();
    var body = {
      "mobileNumber": mobileNumber,
      "password": password,
    };

    try {
      var response = await http.post(
        Uri.parse(loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        var token = jsonResponse['token'];
        SetGetStaffData.SetData(prefs, token);
        print(response.statusCode);
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Successfully Logged In"),
              duration: Duration(seconds: 1),
              elevation: 10,
              backgroundColor: Colors.blueGrey,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(5),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid Credentials"),
              duration: Duration(seconds: 1),
              elevation: 10,
              backgroundColor: Colors.blueGrey,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(5),
            ),
          );
        }
        if (token != null && token != "") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static Future<void> logoutUser(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false);
  }
}
