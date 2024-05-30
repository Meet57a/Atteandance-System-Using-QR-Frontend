// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:frontend/api/entry_log.dart';
import 'package:frontend/screens/student_full_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentDataPage extends StatefulWidget {
  final studentId;
  final firstname;
  final middelname;
  final lastname;
  final medicalcondition;
  final photo;
  final bloodgroup;
  final gender;
  final dob;
  final address;
  final parentBusinessAddress;
  final parentContactNumber;
  final homeContactNumber;
  final school;
  final persuingClass;
  final primarySport;
  final medicalCondition;
  final transportMode;
  final preferredLanguage;
  const StudentDataPage({
    super.key,
    this.studentId,
    this.firstname,
    this.middelname,
    this.lastname,
    this.medicalcondition,
    this.photo,
    this.bloodgroup,
    this.gender,
    this.dob,
    this.address,
    this.parentBusinessAddress,
    this.parentContactNumber,
    this.homeContactNumber,
    this.school,
    this.persuingClass,
    this.primarySport,
    this.medicalCondition,
    this.transportMode,
    this.preferredLanguage,
  });

  @override
  State<StudentDataPage> createState() => _StudentDataPageState();
}

class _StudentDataPageState extends State<StudentDataPage> {
  int studentId = 0;
  String firstName = "";
  String middleName = "";
  String lastName = "";
  String medicalCondition = "";
  String photo = "";
  String bloodgroup = "";
  String gender = "";
  String dob = "";
  String address = "";
  String parentBusinessAddress = "";
  String parentContactNumber = "";
  String homeContactNumber = "";
  String school = "";
  String persuingClass = "";
  String primarySport = "";
  String transportMode = "";
  String preferredLanguage = "";
  String token = "";
  static bool exitTimes = false;

  @override
  void initState() {
    studentId = widget.studentId;
    firstName = widget.firstname;
    middleName = widget.middelname;
    lastName = widget.lastname;
    medicalCondition = widget.medicalcondition;
    photo = widget.photo;
    bloodgroup = widget.bloodgroup;
    gender = widget.gender;
    dob = widget.dob;
    address = widget.address;
    parentBusinessAddress = widget.parentBusinessAddress;
    parentContactNumber = widget.parentContactNumber;
    homeContactNumber = widget.homeContactNumber;
    school = widget.school;
    persuingClass = widget.persuingClass;
    primarySport = widget.primarySport;
    transportMode = widget.transportMode;
    preferredLanguage = widget.preferredLanguage;
    exitTimes = EntryLog.exitTimes;
    getToken();
    super.initState();
  }

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 39, 46, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(30, 39, 46, 1.0),
        title: const Text(
          "Student Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(30, 39, 46, 1.0),
        elevation: 0,
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentFullDetailsPage(
                    studentId: studentId,
                    firstname: firstName,
                    middelname: middleName,
                    lastname: lastName,
                    medicalcondition: medicalCondition,
                    bloodgroup: bloodgroup,
                    address: address,
                    parentBusinessAddress: parentBusinessAddress,
                    parentContactNumber: parentContactNumber,
                    homeContactNumber: homeContactNumber,
                    school: school,
                    persuingClass: persuingClass,
                    dob: dob,
                    gender: gender,
                    preferredLanguage: preferredLanguage,
                    primarySport: primarySport,
                    transportMode: transportMode,
                    photo: photo,
                  ),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.blueGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: const Text(
              "Get The Full Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Image.network(
                        photo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 150,
                      width: 380,
                      // color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Name : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "$firstName $middleName $lastName",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Mobile No : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  parentContactNumber,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "DOB : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  dob,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Medical Condition : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  medicalCondition,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: 400,
              // color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    width: 170,
                    child: (exitTimes == false)
                        ? ElevatedButton(
                            onPressed: () {
                              EntryLog.entryLog(
                                  studentId, token, "entry", context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.green,
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Approve",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              EntryLog.entryLog(
                                  studentId, token, "exit", context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.red,
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Exit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.red,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Reject",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
