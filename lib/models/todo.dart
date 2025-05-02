class Todo {
  final String data;
  final DateTime createdAt;

  Todo({required this.data, required this.createdAt});

  //convert from todo to json
  Map<String, dynamic> toJson() {
    return {'data': data, 'createdAt': createdAt.toIso8601String()};
  }

  //convert form json to todo
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      data: json['data'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
