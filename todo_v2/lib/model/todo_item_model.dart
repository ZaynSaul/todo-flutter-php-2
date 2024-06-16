class TodoItemModel {
  final String id;
  final String title;
  final String description;
  final String todoId;
  final String isDone;

  TodoItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.todoId,
    required this.isDone,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'todo_id': todoId,
        'is_done': isDone,
      };

  factory TodoItemModel.fromJson(Map<String, dynamic> json) {
    return TodoItemModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      todoId: json['todo_id'],
      isDone: json['is_done'],
    );
  }
}
