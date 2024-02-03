class AddTaskResponse {
  AddTasks? addTasks;

  AddTaskResponse({this.addTasks});

  AddTaskResponse.fromJson(Map<String, dynamic> json) {
    addTasks = json['addTasks'] != null
        ? new AddTasks.fromJson(json['addTasks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addTasks != null) {
      data['addTasks'] = this.addTasks!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['employeeId'] = this.employeeId;
    data['organizationId'] = this.organizationId;
    data['projectId'] = this.projectId;
    data['taskCategoryId'] = this.taskCategoryId;
    data['taskName'] = this.taskName;
    data['isCompleted'] = this.isCompleted;
    data['dueDate'] = this.dueDate;
    data['taskPriority'] = this.taskPriority;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}