import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';
import 'package:kestral/datamodal/project_detail.dart';

import '../datamodal/add_task.dart';

final String addTaskMutation = """
  mutation AddTasks(
    \$projectId: Int!
    \$taskCategoryId: Int!
    \$employeeId: Int!
    \$taskName: String!
    \$isCompleted: Boolean
    \$dueDate: Date
    \$taskPriority: String
) {
addTasks(
    projectId: \$projectId
    taskCategoryId: \$taskCategoryId
    employeeId: \$employeeId
    taskName: \$taskName
    isCompleted: \$isCompleted
    dueDate: \$dueDate
    taskPriority: \$taskPriority
)
} 
""";

 addTask(int projectId, int taskCategoryId, int employeeId, String taskName, String dueDate,String taskPriority) async {
  final MutationOptions options = MutationOptions(
  document: gql(addTaskMutation),
    variables: <String, dynamic>{
      "projectId": projectId,
      "taskCategoryId": taskCategoryId,
      "employeeId": employeeId,
      "taskName": taskName,
      "isCompleted": false,
      "dueDate": dueDate,
      "taskPriority": taskPriority,
    } ,
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    print(result.data);
    AddTaskResponse taskResponse = AddTaskResponse.fromJson(result.data!);
    //ProjectList projectList = ProjectList.fromJson(result.data!);
    //return projectList;
  }
}
