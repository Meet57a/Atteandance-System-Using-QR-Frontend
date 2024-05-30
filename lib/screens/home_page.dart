import 'package:flutter/material.dart';
import 'package:frontend/api/get_staff_detail.dart';

import 'package:frontend/screens/scanner_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var token = "";
  int staffId = 0;
  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    staffId = prefs.getInt("staffId")!;
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(30, 39, 46, 1.0),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(30, 39, 46, 1.0),
          title: const Text(
            "Home Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(30, 39, 46, 1.0),
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScannerPage(),
                    ),
                  );
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.qr_code,
                        color: Colors.black,
                      ),
                      Text("Scan the QR Code"),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  GetStaffData.getData(staffId, token, context);
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Image(
            image: AssetImage("assets/logo.png"),
          ),
        ));
  }
}
