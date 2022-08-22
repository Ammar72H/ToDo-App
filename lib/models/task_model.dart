class TaskModel{
  String id;
  String title;
  String description;
  int datetime;
  bool isDone;

  TaskModel({this.id='',
  required this.title,
   required this.description,
    required this.datetime,
    this.isDone=false});


  TaskModel.fromJson(Map<String,dynamic>josn) : this(
    id: josn['id'] as String ,
    title: josn['title'] as String ,
    description: josn['description'] as String ,
    datetime: josn['date'] as int ,
    isDone: josn['isDone'] as bool ,

  );


  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'description':description,
      'date':datetime,
      'isDone':isDone,

    };
  }


}