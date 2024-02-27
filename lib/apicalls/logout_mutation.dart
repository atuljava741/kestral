import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';
import 'dart:io' show Platform;

import 'package:kestral/datamodal/user_aunthentication.dart';

import '../utils/utils.dart';

final String logoutMutation = """
  mutation LogoutUser(\$data: [JSON]!) {	
      logoutUser(data: \$data) 
    } 
""";

Future<String?> logoutUserMutation(data) async {
  Utils.printLog("Sending data ${data}");
  Utils.printLog("Log out using ${Utils.accessToken}");
  if (data == null){
    data = [];
  }
  final MutationOptions options = MutationOptions(
    document: gql(logoutMutation),
    variables: <String, dynamic>{
       "data": data
    },
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    Utils.printLog(result.exception!.graphqlErrors.first.message);
    return result.exception!.graphqlErrors.first.message;
  } else {
    Utils.printLog("Logout Success");
    return "true";
  }
}
