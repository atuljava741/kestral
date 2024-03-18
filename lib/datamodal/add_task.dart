class AddTaskResponse {
  AddTasks? addTasks;

  AddTaskResponse({this.addTasks});

  AddTaskResponse.fromJson(Map<String, dynamic> json) {
    addTasks = json['addTasks'] != null
        ? AddTasks.fromJson(json['addTasks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addTasks != null) {
      data['addTasks'] = addTasks!.toJson();
    }
    return data;
  }
}

class AddTasks {
  int? id;
  String? createdAt;
  int? employeeId;
  int? organizationId;
  int? projectId;
  int? taskCategoryId;
  String? taskName;
  bool? isCompleted;
  String? dueDate;
  String? taskPriority;
  String? updatedAt;

  AddTasks(
      {this.id,
        this.createdAt,
        this.employeeId,
        this.organizationId,
        this.projectId,
        this.taskCategoryId,
        this.taskName,
        this.isCompleted,
        this.dueDate,
        this.taskPriority,
        this.updatedAt});

  AddTasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    employeeId = json['employeeId'];
    organizationId = json['organizationId'];
    projectId = json['projectId'];
    taskCategoryId = json['taskCategoryId'];
    taskName = json['taskName'];
    isCompleted = json['isCompleted'];
    dueDate = json['dueDate'];
    taskPriority = json['taskPriority'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['employeeId'] = employeeId;
    data['organizationId'] = organizationId;
    data['projectId'] = projectId;
    data['taskCategoryId'] = taskCategoryId;
    data['taskName'] = taskName;
    data['isCompleted'] = isCompleted;
    data['dueDate'] = dueDate;
    data['taskPriority'] = taskPriority;
    data['updatedAt'] = updatedAt;
    return data;
  }
}