import 'package:todo_v2/model/todo_item_model.dart';

class TodoModel {
  final String id;
  final String title;
  final String userId;
  final List<TodoItemModel>? items;
  final String isDone;

  TodoModel({
    required this.id,
    required this.title,
    required this.userId,
    this.items,
    required this.isDone,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'userId': userId,
        'items': List<dynamic>.from(items!.map((x) => x.toJson())),
        'is_done': isDone,
      };

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      userId: json['user_id'],
      items: json["items"] == null
          ? []
          : List<TodoItemModel>.from(
              (json["items"] as List)
                  .map((x) => TodoItemModel.fromJson(x))
                  .toList(),
            ),
      isDone: json['is_done'],
    );
  }
}
