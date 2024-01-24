class ProjectList {
  ProjectList({
    required this.getActiveProjectDetailsByEmployeeId,
  });
  late final List<Projects> getActiveProjectDetailsByEmployeeId;

  ProjectList.fromJson(Map<String, dynamic> json){
    getActiveProjectDetailsByEmployeeId = List.from(json['getActiveProjectDetailsByEmployeeId']).map((e)=>Projects.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['getActiveProjectDetailsByEmployeeId'] = getActiveProjectDetailsByEmployeeId.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Projects {
  Projects({
    required this.projectId,
    required this.projectName,
    required this.projectManagerId,
    required this.projectManager,
    required this.expectedStartDate,
    required this.expectedEndDate,
    required this.actualStartDate,
    required this.actualEndDate,
    required this.allocationPercentage,
    required this.billable,
  });
  late final int projectId;
  late final String projectName;
  late final int projectManagerId;
  late final String projectManager;
  late final String expectedStartDate;
  late final String expectedEndDate;
  late final String actualStartDate;
  late final String actualEndDate;
  late final int allocationPercentage;
  late final bool billable;

  Projects.fromJson(Map<String, dynamic> json){
    projectId = json['projectId'] ?? 0;
    projectName = json['projectName'] ?? "";
    projectManagerId = json['projectManagerId'] ?? 0;
    projectManager = json['projectManager'] ?? "";
    expectedStartDate = json['expectedStartDate'] ?? "";
    expectedEndDate = json['expectedEndDate'] ?? "";
    actualStartDate = json['actualStartDate'] ?? "";
    actualEndDate = json['actualEndDate'] ?? "";
    allocationPercentage = json['allocationPercentage'] ?? 0;
    billable = json['billable'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['projectId'] = projectId;
    _data['projectName'] = projectName;
    _data['projectManagerId'] = projectManagerId;
    _data['projectManager'] = projectManager;
    _data['expectedStartDate'] = expectedStartDate;
    _data['expectedEndDate'] = expectedEndDate;
    _data['actualStartDate'] = actualStartDate;
    _data['actualEndDate'] = actualEndDate;
    _data['allocationPercentage'] = allocationPercentage;
    _data['billable'] = billable;
    return _data;
  }
}