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
      return result.exception!.graphqlErrors.first.message;
    } else {
      print(result.data);
      return "true";
    }
  } catch (e) {
    print(e);
  }
  return "false";
}
