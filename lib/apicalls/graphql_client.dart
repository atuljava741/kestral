import 'package:graphql/client.dart';

import '../utils/utils.dart';

final HttpLink httpLink = HttpLink(
  //'https://timesheet-backend-dev.kestrelpro.ai/time-sheet/graphql',   // dev
  'https://kestrel-backend-qa.kestrelpro.ai/time-sheet/graphql',   // QA
  //"https://0fa1-111-118-241-68.ngrok-free.app/time-sheet/grapghql",
);

final AuthLink authLink = AuthLink(
  getToken: () async => Utils.accessToken,
);

final Link link = authLink.concat(httpLink);

final GraphQLClient client = GraphQLClient(
  link: link,
  cache: GraphQLCache(),
);
