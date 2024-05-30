import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/screens/students_data_page.dart';
import 'package:http/http.dart' as http;

class GetStudentDetail {
  static void getDetails(studentid, context, token) async {
    try {
      // EntryLog.getEntryLogs(studentid, token);

      var response = await http.get(
          Uri.parse(
            "${url}staff/students/$studentid",
          ),
          headers: {
            'Authorization': '$token',
          });
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var jsonData = jsonResponse['data'];
        var student = jsonData['student'];

        var id = student['id'];
        var firstname = student['firstName'];
        var middelname = student['middleName'];
        var lastname = student['lastName'];
        var photo = student['photo'];
        var bloodGroup = student['bloodGroup'];
        var gender = student['gender'];

        var dob = student['dob'].toString().split('T')[0];

        var address = student['address'].toString();
        var parentBusinessAddress = student['parentBusinessAddress'].toString();
        var parentContactNumber = student['parentContactNumber'];
        var homeContactNumber = student['homeContactNumber'];
        var school = student['school'];
        var persuingClass = student['persuingClass'];
        var primarySport = student['primarySport'];
        var medicalCondition = student['medicalCondition'];

        var transportMode = student['transportMode'];

        var preferredLanguage = student['preferredLanguage'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDataPage(
              studentId: id,
              firstname: firstname,
              middelname: middelname,
              lastname: lastname,
              medicalcondition: medicalCondition,
              parentContactNumber: parentContactNumber,
              dob: dob,
              address: address,
              parentBusinessAddress: parentBusinessAddress,
              homeContactNumber: homeContactNumber,
              school: school,
              persuingClass: persuingClass,
              primarySport: primarySport,
              photo: photo,
              bloodgroup: bloodGroup,
              gender: gender,
              transportMode: transportMode,
              preferredLanguage: preferredLanguage,
            ),
          ),
        );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => StudentsDataScreen(
        //       id: id,
        //       firstname: firstname,
        //       middelname: middelname,
        //       lastname: lastname,
        //       photo: photo,
        //       bloodgroup: bloodGroup,
        //       gender: gender,
        //       dob: dob,
        //       address: address,
        //       parentBusinessAddress: parentBusinessAddress,
        //       parentContactNumber: parentContactNumber,
        //       homeContactNumber: homeContactNumber,
        //       school: school,
        //       persuingClass: persuingClass,
        //       primarySport: primarySport,
        //       medicalCondition: medicalCondition,
        //       transportMode: transportMode,
        //       preferredLanguage: preferredLanguage,

        //       // entryLogs: entryLogs,
        //     ),
        //   ),
        // );
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
