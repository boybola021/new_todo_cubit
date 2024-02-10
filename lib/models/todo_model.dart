//
// class Todo{
//   int id;
//   String title;
//   String description;
//   bool isComplete;
//   Todo({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.isComplete,
// });
//
//
//   factory Todo.fromJson(Map<String,Object?>json){
//     return Todo(
//         id: json["id"]as int,
//         title: json["title"]as String,
//         description: json["description"]as String,
//         isComplete: json["isComplete"] == 1 ? true : false,
//     );
//   }
//
//   Map<String,Object> toJson() => {
//     "id" : id,
//     "title" : title,
//     "description" : description,
//     "isComplete" : isComplete ? 1 : 0,
//   };
//
//   @override
//   bool operator == (Object other){
//     return (other is Todo) && other.id == id &&
//         other.title == title &&
//         other.description == description
//         && other.isComplete == isComplete;
//   }
//
//   @override
//   int get hashCode => Object.hash(id,title,description,isComplete);
//
// }


class Todo {
  int id;
  String title;
  String description;
  bool isComplete;
  Todo(
      {required this.id,
        required this.title,
        required this.description,
        required this.isComplete});

  factory Todo.fromJson(Map<String, Object?> json) {
    return Todo(
      id: json["id"] as int,
      title: json["title"] as String,
      description: json["description"] as String,
      isComplete: json["isComplete"] == 1 ? true : false,
    );
  }

  Map<String, Object> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "isCompleted": isComplete ? 1:0,
  };

  @override
  int get hashCode => Object.hash(id, title, isComplete);

  @override
  bool operator ==(Object other) {
    return other is Todo &&
        other.title == title &&
        other.id == id &&
        other.isComplete == isComplete;
  }

  @override
  String toString() {
    return "$id. title: $title, desc: $description. ";
  }
}