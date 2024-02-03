import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';

import '../datamodal/task_category.dart';
import '../utils/utils.dart';

final String getTaskCategoryQuery = """
  query TaskCategories {
    taskCategories { 
    id 
    taskCategoryTitle 
    operation 
  } 
} 
""";

Future<TaskCategory> getTaskCategoryList() async {
  final QueryOptions options = QueryOptions(
    document: gql(getTaskCategoryQuery),
      );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    //print(result.data);
    TaskCategory taskCategory = TaskCategory.fromJson(result.data!);
    return taskCategory;
  }
}
