import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';
import 'package:kestral/datamodal/project_detail.dart';


final String getProjectQuery = """
  query Query(\$employeeId: Int!) { 
    getActiveProjectDetailsByEmployeeId(employeeId: \$employeeId)
} 
""";

Future<ProjectList> getProjectList(int employeeId) async {
  final QueryOptions options = QueryOptions(
    document: gql(getProjectQuery),
    variables: <String, dynamic>{
      'employeeId': employeeId, // Replace with your actual employee ID
    },
  );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    print(result.data);
    ProjectList projectList = ProjectList.fromJson(result.data!);
    return projectList;
  }
}
