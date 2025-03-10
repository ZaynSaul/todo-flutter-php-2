import 'package:http/http.dart' as http;
import 'package:todo_v2/core/services/global_services.dart';
import 'package:todo_v2/env.dart';

class TodoServices {
  static Future add(String title, String userId) async {
    var data = {
      "title": title,
      "user_id": userId,
    };

    var url = Uri.parse("${AppEnvironment.apiBaseURL}add_todo.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future view(String userId) async {
    var data = {"user_id": userId};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}show_todo.php");
    http.Response response = await http.post(url, headers: headers, body: data);

    return response;
  }

  static Future update(String id, String title) async {
    Map data = {
      "id": id,
      "title": title,
    };

    var url = Uri.parse("${AppEnvironment.apiBaseURL}update_todo.php");
    http.Response response = await http.post(url, headers: headers, body: data);

    return response;
  }

  static Future deleteList(String id) async {
    var data = {"id": id};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}delete_list.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future deleteMultipleLists(String id) async {
    var data = {"id": id};

    var url =
        Uri.parse("${AppEnvironment.apiBaseURL}delete_multiple_lists.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future doneTodo(String id, String isDone) async {
    var data = {"id": id, "is_done": isDone};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}done_todo.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }
}
