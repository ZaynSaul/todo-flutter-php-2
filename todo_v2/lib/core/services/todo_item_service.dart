import 'package:http/http.dart' as http;
import 'package:todo_v2/env.dart';

class TodoItemServices {
  static Future add(String title, String description, String todoId) async {
    var data = {
      "title": title,
      "description": description,
      "todo_id": todoId,
    };

    var url = Uri.parse("${AppEnvironment.apiBaseURL}add_todo_item.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future view(String todoId) async {
    var data = {"todo_id": todoId};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}show_todo_item.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future update(String id, String title, String description) async {
    var data = {"id": id, "title": title, "description": description};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}update_todo_item.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future delete(String id) async {
    var data = {"id": id};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}delete_todo_item.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future deleteCompleted(String id) async {
    var data = {"id": id};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}delete_completed.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future doneTodo(String id, String isDone) async {
    var data = {"id": id, "is_done": isDone};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}done_todo_item.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }

  static Future countTodoItem(String todoId) async {
    var data = {"todo_id": todoId};

    var url = Uri.parse("${AppEnvironment.apiBaseURL}count_todo_item.php");
    http.Response response = await http.post(url, body: data);

    return response;
  }
}
