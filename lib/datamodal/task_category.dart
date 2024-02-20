class TaskCategory {
  TaskCategory({
    required this.taskCategories,
  });
  late final List<TaskCategories> taskCategories;

  TaskCategory.fromJson(Map<String, dynamic> json){
    taskCategories = List.from(json['taskCategories']).map((e)=>TaskCategories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['taskCategories'] = taskCategories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TaskCategories {
  TaskCategories({
    required this.id,
    required this.taskCategoryTitle,
    required this.operation,
  });
  late final int id;
  late final String taskCategoryTitle;
  late final String operation;

  TaskCategories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    taskCategoryTitle = json['taskCategoryTitle'] ?? "";
    operation = json['operation'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['taskCategoryTitle'] = taskCategoryTitle;
    _data['operation'] = operation;
    return _data;
  }
}