class SessionHandler {
  static bool isLogin = false;
  static String token = "";
  static void isLoginMeth(prefs) async {
    try {
      token = prefs.getString('token');
      print(token);
      if (token.isNotEmpty || token != "") {
        isLogin = true;
      } else {
        isLogin = false;
      }
    } catch (e) {
      isLogin = false;
    }
  }
}
