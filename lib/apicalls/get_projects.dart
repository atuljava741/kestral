import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';
import 'package:kestral/datamodal/project_detail.dart';

import '../utils/utils.dart';


final String getProjectQuery = """
  query Query(\$employeeId: Int!) { 
    getActiveProjectDetailsByEmployeeId(employeeId: \$employeeId)
} 
""";

Future<bool> getProjectList(int employeeId) async {
  final QueryOptions options = QueryOptions(
    document: gql(getProjectQuery),
    variables: <String, dynamic>{
      'employeeId': employeeId, // Replace with your actual employee ID
    },
  );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    print("In Error getProjectList : "+result.exception!.graphqlErrors.first.message);
    return false;
  } else {
    print("In Success getProjectList");
    print(result.data);
    ProjectList allprojects = ProjectList.fromJson(result.data!);
    Utils.projectList = allprojects.getActiveProjectDetailsByEmployeeId;
    return true;
  }
}
