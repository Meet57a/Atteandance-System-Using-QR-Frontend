// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentFullDetailsPage extends StatefulWidget {
  final studentId;
  final firstname;
  final middelname;
  final lastname;
  final medicalcondition;
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
  final photo;
  const StudentFullDetailsPage({
    super.key,
    this.studentId,
    this.firstname,
    this.middelname,
    this.lastname,
    this.medicalcondition,
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
    this.photo,
  });

  @override
  State<StudentFullDetailsPage> createState() => _StudentFullDetailsPageState();
}

class _StudentFullDetailsPageState extends State<StudentFullDetailsPage> {
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
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(30, 39, 46, 1.0),
        title: const Text(
          "Student Full Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Container(
              height: 1100,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
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
                  const SizedBox(height: 20),
                  const Text(
                    "Student Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 800,
                    width: 380,
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
                                "Blood Gorup : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                bloodgroup,
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
                                "Gender : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                gender,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Address : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              address.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Parent Business Address : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              parentBusinessAddress.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              // const SizedBox(height: 60),
                              const Text(
                                "Parent Contact Number : ",
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
                              // const SizedBox(height: 60),
                              const Text(
                                "Home Contact Number : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                homeContactNumber,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              // const SizedBox(height: 60),
                              const Text(
                                "School : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                school,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // const SizedBox(height: 60),
                              const Text(
                                "Persuing Class : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                persuingClass,
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
                                "Primary Sports : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                persuingClass,
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
                          Row(
                            children: [
                              const Text(
                                "Transport Mode : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                transportMode,
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
                                "Preferred Language : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                preferredLanguage,
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
        ),
      ),
    );
  }
}
