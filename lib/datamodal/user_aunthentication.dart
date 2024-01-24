class UserAuthResponse {
  UserAuthResponse({
    required this.data,
  });
  late final UserData data;

  UserAuthResponse.fromJson(Map<String, dynamic> json){
    data = UserData.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class UserData {
  UserData({
    required this.userAuthentication,
  });
  late final UserAuthentication userAuthentication;

  UserData.fromJson(Map<String, dynamic> json){
    userAuthentication = UserAuthentication.fromJson(json['userAuthentication']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userAuthentication'] = userAuthentication.toJson();
    return _data;
  }
}

class UserAuthentication {
  UserAuthentication({
    required this.exp,
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.orgId,
    required this.email,
    required this.employeeCode,
    required this.empRoleId,
    required this.teamId,
    required this.appRoleId,
    required this.employeeStatus,
    required this.isShowScreenshotPreview,
    required this.isShowScreenshotThumbnail,
    required this.isCaptureScreenshot,
    required this.appRoleTitle,
    required this.bucketName,
    required this.toolVersion,
    required this.os,
    required this.systemArchitecture,
    required this.osVersion,
    required this.updatedAt,
    required this.token,
  });
  late var exp;
  late var id;
  late var employeeId;
  late final String employeeName;
  late var orgId;
  late final String email;
  late final String employeeCode;
  late var empRoleId;
  late var teamId;
  late var appRoleId;
  late var employeeStatus;
  late final bool isShowScreenshotPreview;
  late final bool isShowScreenshotThumbnail;
  late final bool isCaptureScreenshot;
  late final String appRoleTitle;
  late final String bucketName;
  late final String toolVersion;
  late final String os;
  late final String systemArchitecture;
  late final String osVersion;
  late final String updatedAt;
  late final String token;

  UserAuthentication.fromJson(Map<String, dynamic> json){
    exp = json['exp'];
    id = json['id'];
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    orgId = json['orgId'];
    email = json['email'];
    employeeCode = json['employeeCode'];
    empRoleId = json['empRoleId'];
    teamId = json['teamId'];
    appRoleId = json['appRoleId'];
    employeeStatus = json['employeeStatus'];
    isShowScreenshotPreview = json['isShowScreenshotPreview'];
    isShowScreenshotThumbnail = json['isShowScreenshotThumbnail'];
    isCaptureScreenshot = json['isCaptureScreenshot'];
    appRoleTitle = json['appRoleTitle'];
    bucketName = json['bucketName'];
    toolVersion = json['toolVersion'];
    os = json['os'];
    systemArchitecture = json['systemArchitecture'];
    osVersion = json['osVersion'];
    updatedAt = json['updatedAt'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['exp'] = exp;
    _data['id'] = id;
    _data['employeeId'] = employeeId;
    _data['employeeName'] = employeeName;
    _data['orgId'] = orgId;
    _data['email'] = email;
    _data['employeeCode'] = employeeCode;
    _data['empRoleId'] = empRoleId;
    _data['teamId'] = teamId;
    _data['appRoleId'] = appRoleId;
    _data['employeeStatus'] = employeeStatus;
    _data['isShowScreenshotPreview'] = isShowScreenshotPreview;
    _data['isShowScreenshotThumbnail'] = isShowScreenshotThumbnail;
    _data['isCaptureScreenshot'] = isCaptureScreenshot;
    _data['appRoleTitle'] = appRoleTitle;
    _data['bucketName'] = bucketName;
    _data['toolVersion'] = toolVersion;
    _data['os'] = os;
    _data['systemArchitecture'] = systemArchitecture;
    _data['osVersion'] = osVersion;
    _data['updatedAt'] = updatedAt;
    _data['token'] = token;
    return _data;
  }
}