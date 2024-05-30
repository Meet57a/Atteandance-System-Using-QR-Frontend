import 'package:flutter/material.dart';
import 'package:frontend/api/get_student_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  bool isLoading = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // QRViewController? controller;
  String token = "";
  final _outputController = TextEditingController();

  // getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token')!;
  // }

  @override
  void initState() {
    // getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 39, 46, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(30, 39, 46, 1.0),
        title: const Text(
          "Scanner",
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
        child: ElevatedButton(
          onPressed: () {
            // getData();
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.blueGrey),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          child: const Text(
            "Get the data",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Scan the QR Code",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              "Scan the QR Code to get the student identity",
              textScaler: TextScaler.linear(0.5),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),

            ElevatedButton(onPressed: _scan, child: Text("data")),
            // Container(
            //   height: 300,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.white,
            //   ),
            //   child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
            // ),
          ],
        ),
      ),
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      print(barcode.replaceRange(0, 7, "").trim());
      this._outputController.text = barcode;
    }
  }

  // getData() {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   GetStudentDetail.getDetails(result!.code, context, token);
  // }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;

  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //       controller.stopCamera();
  //       Timer(const Duration(seconds: 2), () {
  //         setState(() {
  //           controller.resumeCamera();
  //         });
  //       });
  //     });
  //     getData();
  //     EntryLog.getEntryLogs(result!.code, token);

  //   });
  // }

  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }
}
