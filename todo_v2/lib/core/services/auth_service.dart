import 'package:http/http.dart' as http;
import 'package:todo_v2/env.dart';

class AuthServices {
  static Future register(String name, String email, String password) async {
    var data = {"name": name, "email": email, "password": password};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}register.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future login(String email, String password) async {
    var data = {"email": email, "password": password};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}login.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future changePassword(
      String email, String password, String newPassword) async {
    var data = {
      "email": email,
      "password": password,
      "new_password": newPassword,
    };

    var url = Uri.parse("${AppEnvironment.apiBaseURL}change_password.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }
}
