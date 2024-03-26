import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';

import '../datamodal/add_task.dart';
import '../utils/utils.dart';

const String addTaskMutation = """
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
   var objPost =  {
   "projectId": projectId,
   "taskCategoryId": taskCategoryId,
   "employeeId": employeeId,
   "taskName": taskName,
   "isCompleted": false,
   "dueDate": dueDate,
   "taskPriority": taskPriority,
   };
  final MutationOptions options = MutationOptions(
  document: gql(addTaskMutation),
    variables:objPost ,
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    Utils.printLog(result.exception!.graphqlErrors.toString());
    throw Exception(result.exception.toString());
  } else {
    print(result.data);
    print("response add task ${result.data}");

    AddTaskResponse taskResponse = AddTaskResponse.fromJson(result.data!);
    //ProjectList projectList = ProjectList.fromJson(result.data!);
    //return projectList;
  }
}
