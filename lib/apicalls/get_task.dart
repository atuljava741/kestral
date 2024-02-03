import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';
import 'package:kestral/datamodal/incomplete_task.dart';
import 'package:kestral/datamodal/user_aunthentication.dart';


final String getMyTaskQuery = """
  query Query(\$projectId: Int!, \$employeeId: Int!) {
          getInCompleteTasks(projectId: \$projectId, employeeId: \$employeeId)
        }
""";

Future<InCompleteTaskList> getMyTaskList(int projectId, int employeeId) async {
  final QueryOptions options = QueryOptions(
    document: gql(getMyTaskQuery),
    variables: <String, dynamic>{
      'projectId': projectId, // Replace with your actual project ID
      'employeeId': employeeId, // Replace with your actual employee ID
    },
  );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    print(result.data);
    InCompleteTaskList inCompleteTasks = InCompleteTaskList.fromJson(result.data!);
    return inCompleteTasks;
  }
}
