class TodoModel{
  int? id;
  String? title;
  String? date;
  String? time;
  String? type;
  String? status;
  String? fav;

  TodoModel({
    required this.title,
    required this.date,
    required this.time,
    required this.type,
    required this.status,
    required this.fav,
  });

  TodoModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
    status = json['status'];
    fav = json['fav'];
  }

  Map<String, dynamic> toJson(){
    return {
      "title" : title,
      "date" : date,
      "time" : time,
      "type" : type,
      "fav" : fav,
      "fav" : fav,
    };
  }

}