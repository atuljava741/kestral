import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';

import '../utils/utils.dart';
import 'logout_mutation.dart';

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
\$screenshotImageUrl: String!
\$comment: String 
\$timeZone: String!
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
timeZone: \$timeZone\
) 
} 
""";

Future<String> addTimeToKestral(body) async {
  try {
    final MutationOptions options = MutationOptions(
      document: gql(addTimeMutation),
      variables: body,
    );

    final QueryResult result = await client.mutate(options);
    if (result.hasException) {
      try {
        Utils.accessToken =
            result.exception!.graphqlErrors.first.extensions!["cacheToken"] ?? "";
        if(Utils.accessToken.length > 5) {
          var queue = Utils.getPreference().getString('queue');
          print(queue);
          Utils.deviceId = Utils.getPreference().getString('deviceId')!;
          await logoutUserMutation(queue);
          await Utils.getPreference().clear();
          if (queue != null) {
            await Utils.getPreference().setString('deviceId', Utils.deviceId);
          }
        }
      } catch (e) {}
      return result.exception!.graphqlErrors.first.message;
    }
    else {
      print(result.data);
      return "true";
    }
  } catch (e) {
    print(e);
  }
  return "false";
}
