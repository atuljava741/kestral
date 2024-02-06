import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';
import 'dart:io' show Platform;

import 'package:kestral/datamodal/user_aunthentication.dart';

import '../utils/utils.dart';

final String createPostMutation = """
  mutation UserAuthentication(
    \$loginType: LoginType! 
    \$input: buildVersionInput!) {	
      userAuthentication(loginType: \$loginType, input: \$input) 
    } 
""";

Future<String?> customLoginMutation(String email, String password) async {
  print(Utils.deviceId);
  final MutationOptions options = MutationOptions(
    document: gql(createPostMutation),
    variables: <String, dynamic>{
      "loginType": "CUSTOM",
      "input": {
        "os": Platform.isAndroid?"Android": "IOS",
        "buildType": "latest",
        "version": Platform.version,
        "systemArchitecture": "",
        "osVersion": Platform.version,
        "deviceId" : Utils.deviceId,
        "deviceName" : Utils.deviceName,
        "data": {
          "email": email,
          "password": password,
        }
      }
    },
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print("Exception" + result.exception!.graphqlErrors.first.message);
    return result.exception!.graphqlErrors.first.message;
  } else {
    print(result.data!);
    UserAuthResponse userData =  UserAuthResponse.fromJson(result.data!);
    Utils.userInformation = userData;
    Utils.accessToken = userData.data.userAuthentication.token;
    print(userData.data.userAuthentication.token);
    print("true");
    return "true";
  }
}
