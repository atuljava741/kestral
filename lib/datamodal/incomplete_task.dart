class InCompleteTaskList {
  InCompleteTaskList({
    required this.data,
  });
  late final InCompleteTask data;

  InCompleteTaskList.fromJson(Map<String, dynamic> json){
    data = InCompleteTask.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class InCompleteTask {
  InCompleteTask({
    required this.getInCompleteTasks,
  });
  late final List<GetInCompleteTasks> getInCompleteTasks;

  InCompleteTask.fromJson(Map<String, dynamic> json){
    getInCompleteTasks = List.from(json['getInCompleteTasks']).map((e)=>GetInCompleteTasks.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['getInCompleteTasks'] = getInCompleteTasks.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class GetInCompleteTasks {
  GetInCompleteTasks({
    required this.id,
    required this.projectId,
    required this.taskCategoryId,
    required this.employeeId,
    required this.taskName,
    required this.isCompleted,
    required this.organizationId,
    required this.dueDate,
    required this.taskPriority,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int projectId;
  late final int taskCategoryId;
  late final int employeeId;
  late final String taskName;
  late final bool isCompleted;
  late final int organizationId;
  late final String dueDate;
  late final String taskPriority;
  late final String createdAt;
  late final String updatedAt;

  GetInCompleteTasks.fromJson(Map<String, dynamic> json){
    id = json['id'];
    projectId = json['projectId'];
    taskCategoryId = json['taskCategoryId'] ?? "";
    employeeId = json['employeeId'];
    taskName = json['taskName'] ?? "";
    isCompleted = json['isCompleted'];
    organizationId = json['organizationId'];
    dueDate = json['dueDate'] ?? "";
    taskPriority = json['taskPriority'] ?? "";
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['projectId'] = projectId;
    _data['taskCategoryId'] = taskCategoryId;
    _data['employeeId'] = employeeId;
    _data['taskName'] = taskName;
    _data['isCompleted'] = isCompleted;
    _data['organizationId'] = organizationId;
    _data['dueDate'] = dueDate;
    _data['taskPriority'] = taskPriority;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}