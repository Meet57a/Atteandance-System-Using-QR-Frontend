// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignor
import 'package:flutter/material.dart';
import 'package:frontend/api/entry_log.dart';
import 'package:frontend/screens/scanner_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentsDataScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final id;
  // // ignore: prefer_typing_uninitialized_variables
  final firstname;
  // // ignore: prefer_typing_uninitialized_variables
  final middelname;
  final lastname;
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

  // final entryLogs;/

  const StudentsDataScreen({
    super.key,
    this.id,
    this.firstname,
    this.lastname,
    this.middelname,
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

    // this.entryLogs,
  });

  @override
  State<StudentsDataScreen> createState() => _StudentsDataScreenState();
}

class _StudentsDataScreenState extends State<StudentsDataScreen> {
  int id = 0;
  var firstname = "";
  var middelname = "";
  var lastname = "";
  var photo = "";
  var bloodgroup = "";
  var gender = "";
  var dob = "";
  String address = "";
  String parentBusinessAddress = "";
  String parentContactNumber = "";
  String homeContactNumber = "";
  String school = "";
  String persuingClass = "";
  String primarySport = "";
  String medicalCondition = "";
  String transportMode = "";
  String preferredLanguage = "";
  // String entryLogs = "";
  String onboardedById = "";
  String onboardedBy = "";
  String token = "";
  static bool exitTimes = false;

  @override
  void initState() {
    getToken();
    id = widget.id;
    firstname = widget.firstname;
    middelname = widget.middelname;
    lastname = widget.lastname;
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
    medicalCondition = widget.medicalCondition;
    transportMode = widget.transportMode;
    preferredLanguage = widget.preferredLanguage;
    exitTimes = EntryLog.exitTimes;

    super.initState();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                "id: ${id.toString()}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "firstname: $firstname",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "middelname: $middelname",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "lastname: $lastname",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "photo: $photo",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "bloodGroup: $bloodgroup",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "gender: $gender",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "dob: $dob",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "address: $address",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "parentBusinessAddress: $parentBusinessAddress",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "parentContactNumber: $parentContactNumber",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "homeContactNumber: $homeContactNumber",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "school: $school",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "persuingClass: $persuingClass",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "primarySport: $primarySport",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "medicalCondition: $medicalCondition",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "transportMode: $transportMode",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "preferredLanguage: $preferredLanguage",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   "entryLogs: $entryLogs",
              //   style: const TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: (exitTimes == false)
                        ? ElevatedButton(
                            onPressed: () {
                              EntryLog.entryLog(id, token, "entry", context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Approve",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              EntryLog.entryLog(id, token, "exit", context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            child: const Text(
                              "exit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const ScannerPage()),
                            (route) => false);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Reject",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
