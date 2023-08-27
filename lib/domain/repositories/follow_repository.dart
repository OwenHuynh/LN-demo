import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/graphql/nft_mutation.dart';
import 'package:lnsp/data/graphql/nft_query.dart';
import 'package:lnsp/data/remotes/base/base_response.dart';
import 'package:lnsp/data/remotes/graphql/client.dart';
import 'package:lnsp/data/remotes/graphql/client_provider.dart';
import 'package:lnsp/domain/entities/input/follow_input.dart';
import 'package:lnsp/domain/entities/input/follow_search_input.dart';
import 'package:lnsp/domain/repositories/base/base_repository.dart';

final followRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return FollowRepository(client);
});

class FollowRepository extends BaseRepository {
  FollowRepository(this.client);

  final GraphQLApiClient client;
  static String followOperationName = 'follow';
  static String followsOperationName = 'follows';
  static String removeOperationName = 'removeFollow';

  Future<SealedResult<QueryResult>> getFollows(
      FollowSearchInput followSearchInput) async {
    final result = await client.query(gql(NFTQuery.followsQuery),
        variables: followSearchInput.toJson(),
        operationName: followsOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> getFollow(FollowInput followInput) async {
    final result = await client.mutate(gql(NFTMutation.followMutation),
        variables: followInput.toJson(), operationName: followOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> removeFollow(
      FollowInput followInput) async {
    final result = await client.mutate(gql(NFTMutation.followRemoveMutation),
        variables: followInput.toJson(), operationName: removeOperationName);
    return result;
  }
}
