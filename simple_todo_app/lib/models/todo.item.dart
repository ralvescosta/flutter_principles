class TodoItem {
  String title;
  bool done;

  TodoItem({this.title, this.done});

  TodoItem.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.done = json["done"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["title"] = this.title;
    data["done"] = this.done;

    return data;
  }
}
