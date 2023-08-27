import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/remotes/graphql/client.dart';

final clientProvider = Provider((_) {
  return GraphQLApiClient();
});
