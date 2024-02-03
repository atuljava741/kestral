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

Future<void> customLoginMutation(String email, String password) async {
  final MutationOptions options = MutationOptions(
    document: gql(createPostMutation),
    variables: <String, dynamic>{
      "loginType": "CUSTOM",
      "input": {
        "os": Platform.isAndroid?"Android": "IOS",
        "buildType": "latest",
        "version": "4.0",
        "systemArchitecture": "",
        "osVersion": Platform.version,
        "deviceId" : "1234567890",
        "deviceName" : "Samsung A80",
        "data": {
          "email": email,
          "password": password,
        }
      }
    },
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print('Mutation failed: ${result.exception.toString()}');
  } else {
    UserAuthResponse userData =  UserAuthResponse.fromJson(result.data!);
    Utils.userInformation = userData;
    Utils.accessToken = userData.data.userAuthentication.token;
    print(userData.data.userAuthentication.token);
  }
}
