import 'package:graphql/client.dart';

import '../utils/utils.dart';

final HttpLink httpLink = HttpLink(
  'https://timesheet-backend-dev.kestrelpro.ai/time-sheet/graphql',   // dev
  //'https://kestrel-backend-qa.kestrelpro.ai/time-sheet/graphql',   // QA
);

final AuthLink authLink = AuthLink(
  getToken: () async => Utils.accessToken,
);

final Link link = authLink.concat(httpLink);

final GraphQLClient client = GraphQLClient(
  link: link,
  cache: GraphQLCache(),
);
