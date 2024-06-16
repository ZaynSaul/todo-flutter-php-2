import 'package:http/http.dart' as http;
import 'package:todo_v2/env.dart';

class UploadProfile {
  static Future upload(
      String? profileName, String? imageData, String userId) async {
    var data = {
      "profileName": profileName,
      "profileData": imageData,
      "user_id": userId,
    };

    var url = Uri.parse("${AppEnvironment.apiBaseURL}upload_profile.php");

    http.Response response = await http.post(url, body: data);

    return response;
  }
}
