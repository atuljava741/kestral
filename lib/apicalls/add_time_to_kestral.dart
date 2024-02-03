import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';

import '../utils/utils.dart';

final String addTimeMutation = """
  mutation Mutation( 
\$projectId: Int! 
\$employeeId: Int! 
\$taskDescription: String! 
\$date: Date! 
\$effortInHrsMin: Time! 
\$completion: Int! 
\$taskStatusId: Int! 
\$taskCategoryId: Int! 
\$isManual: Boolean! 
\$taskId: Int! 
\$durationFrom: String! 
\$durationTo: String! 
\$totalTimeSpent: String! 
\$imageCaptureTime: Time! 
\$keyPressCount: Int! 
\$mousePressCount: Int! 
\$idealFlag: Int! 
\$organizationId: Int 
\$screenshotImageUrl: String 
\$comment: String 
) { 
addTimesheetDetails( 
projectId: \$projectId 
employeeId: \$employeeId 
taskDescription: \$taskDescription 
date: \$date 
effortInHrsMin: \$effortInHrsMin 
completion: \$completion 
taskStatusId: \$taskStatusId 
taskCategoryId: \$taskCategoryId 
isManual: \$isManual 
taskId: \$taskId 
durationFrom: \$durationFrom 
durationTo: \$durationTo 
totalTimeSpent: \$totalTimeSpent 
imageCaptureTime: \$imageCaptureTime 
keyPressCount: \$keyPressCount 
mousePressCount: \$mousePressCount 
idealFlag: \$idealFlag 
organizationId: \$organizationId 
screenshotImageUrl: \$screenshotImageUrl 
comment: \$comment 
) 
} 
""";

addTimeToKestral(int projectId, String taskName, int taskCategoryId, int taskId,String dateOfTask,String durationFrom, String durationTo) async {
  final MutationOptions options = MutationOptions(
    document: gql(addTimeMutation),
    variables: <String, dynamic>{
      "projectId": projectId ,
      "employeeId":   Utils.userInformation!.data.userAuthentication.employeeId,
      "taskDescription": taskName,
      "effortInHrsMin": "00:00",
      "totalTimeSpent": "00:00",
      "completion": 0,
      "taskStatusId": 2,
      "taskCategoryId": taskCategoryId,
      "taskId": taskId,
      "date": dateOfTask,
      "durationFrom": durationFrom,
      "durationTo": durationTo,
      "imageCaptureTime": "",
      "isManual": false,
      "mousePressCount": 0,
      "keyPressCount": 0,
      "organizationId": Utils.userInformation!.data.userAuthentication.orgId,
      "idealFlag": 0,
      "screenshotImageUrl": null,
      "comment": null
    }  ,
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    print(result.data);
    //AddTaskResponse taskResponse = AddTaskResponse.fromJson(result.data!);
    //ProjectList projectList = ProjectList.fromJson(result.data!);
    //return projectList;
  }
}
