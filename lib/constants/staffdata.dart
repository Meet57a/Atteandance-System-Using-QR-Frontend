// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:jwt_decoder/jwt_decoder.dart';

class SetGetStaffData {
  static var token = "";
  static int staffId = 0;
  static var role = "";

  static SetData(prefs, token) async {
    print(token);
    token = token;
    Map<String, dynamic> jsonTokenDecoded = JwtDecoder.decode(token);
    staffId = jsonTokenDecoded['id'];
    role = jsonTokenDecoded['role'];
    prefs.setString('token', token);
    prefs.setInt('staffId', staffId);
    prefs.setString('role', role);
  }
}
