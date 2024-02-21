import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kestral/apicalls/graphql_client.dart';
import 'dart:io' show Platform;

import 'package:kestral/datamodal/user_aunthentication.dart';

import '../utils/utils.dart';
import 'logout_mutation.dart';

final String createPostMutation = """
  mutation UserAuthentication(
    \$loginType: LoginType! 
    \$input: buildVersionInput!) {	
      userAuthentication(loginType: \$loginType, input: \$input) 
    } 
""";

Future<String?> customLoginMutation(String email, String password) async {
  var objPost = {
    "loginType": "CUSTOM",
    "input": {
      "os": Platform.isAndroid?"Android": "IOS",
      "buildType": "latest",
      "version": Platform.version,
      "systemArchitecture": "",
      "osVersion": Platform.operatingSystemVersion,
      "deviceId" : Utils.deviceId,
      "deviceName" : Utils.deviceName,
      "data": {
        "email": email,
        "password": password,
      }
    }
  };
  print("parms ${objPost}");
  Utils.logger.i("Login call ${objPost}");
  final MutationOptions options = MutationOptions(
    document: gql(createPostMutation),
    variables: objPost,
  );

  final QueryResult result = await client.mutate(options);
    if (result.hasException) {
      Utils.logger.i("Login failed");
      try {

        Utils.accessToken =
            result.exception!.graphqlErrors.first.extensions!["cacheToken"] ??
                "";
        Utils.logger.i("cacheToken $Utils.accessToken");
      } catch (e) {}
      print(result.exception!.graphqlErrors.first.message ?? "false");
      return result.exception!.graphqlErrors.first.message ?? "false";
    } else {
      print("login response");
      print(result.data!);

      // lines added for clear every thing on coming back
      Utils.deviceId = Utils.getPreference().getString('deviceId')!;
      await Utils.getPreference().clear();
      await Utils.getPreference().setString('deviceId', Utils.deviceId);


      UserAuthResponse userData = UserAuthResponse.fromJson(result.data!);
      Utils.userInformation = userData;
      Utils.accessToken = userData.data.userAuthentication.token;
      Utils.showAddButton = userData.data.userAuthentication.acceptToolTasks;
      await Utils.getPreference().setString("access_token", Utils.accessToken);
      await Utils.getPreference().setString("email", email);
      await Utils.getPreference().setString("password", password);
      print(userData.data.userAuthentication.token);
      print(
          "acceptToolTasks${userData.data.userAuthentication.acceptToolTasks}");
      print("true");

      return "true";
    }
}
