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

// Future<String> addTimeToKestral(body) async {
//   try {
//     final MutationOptions options = MutationOptions(
//       document: gql(addTimeMutation),
//       variables: body,
//     );
//
//     final QueryResult result = await client.mutate(options);
//     if (result.hasException) {
//       try {
//         Utils.accessToken =
//             result.exception!.graphqlErrors.first.extensions!["cacheToken"] ?? "";
//         Utils.errorCode = result.exception!.graphqlErrors.first.extensions!["code"] ?? "";
//         //Utils.printLog(result.exception!.graphqlErrors.toString());
//       } catch (e) {}
//       return result.exception!.graphqlErrors.first.message;
//     }
//     else {
//       return "true";
//     }
//   } catch (e) {
//     print(e);
//   }
//   return "false";
// }

//Remove try catch  for off internet case PATCH
Future<String> addTimeToKestral(body) async {
  try {
    Utils.printLog("Sending Time to server");
    Utils.printLog(body.toString());
    final MutationOptions options = MutationOptions(
      document: gql(addTimeMutation),
      variables: body,
    );

    final QueryResult result = await client.mutate(options);
    if (result.hasException) {
      try {
        Utils.accessToken =
            result.exception!.graphqlErrors.first.extensions!["cacheToken"] ??
                "";
        Utils.errorCode =
            result.exception!.graphqlErrors.first.extensions!["code"] ?? "";
        Utils.printLog("ErrorCode " + Utils.errorCode);
        Utils.printLog(result.exception!.graphqlErrors.toString());
      } catch (e) {
        Utils.printLog(e.toString());
      }
      return result.exception!.graphqlErrors.first.message;
    } else {
      Utils.printLog("Time Synced Successfully");
      return "true";
    }
  } catch (e) {
    Utils.printLog("Error in sync time to server " + e.toString());
  }
  Utils.printLog("Time Not synced to server");
  return "false";
}
