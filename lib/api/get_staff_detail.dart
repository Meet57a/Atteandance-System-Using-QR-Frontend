import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/screens/profile.dart';
import 'package:http/http.dart' as http;

class GetStaffData {
  static void getData(staffId, token, context) async {
    print(staffId);
    print(token);
    try {
      var res = await http.get(
        Uri.parse("${url}staff/get-staff/$staffId"),
        headers: {
          "Authorization": token,
        },
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        var jsonDecoded = jsonDecode(res.body);
        var jsonData = jsonDecoded['data'];
        var staff = jsonData['staff'];
        var name = staff['name'];
        var email = staff['email'];
        var mobileNumber = staff['mobileNumber'];
        var role = staff['role'];

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage(
              name: name,
              email: email,
              mobileNo: mobileNumber,
              role: role,
            )));
      }
    } catch (e) {
      print(e);
    }
  }
}
