import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/graphql/nft_mutation.dart';
import 'package:lnsp/data/remotes/base/base_response.dart';
import 'package:lnsp/data/remotes/graphql/client.dart';
import 'package:lnsp/data/remotes/graphql/client_provider.dart';
import 'package:lnsp/domain/entities/input/image_url_input.dart';
import 'package:lnsp/domain/entities/input/user_input.dart';
import 'package:lnsp/domain/entities/input/user_update_input.dart';
import 'package:lnsp/domain/repositories/base/base_repository.dart';

final userRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return UserRepository(client);
});

class UserRepository extends BaseRepository {
  UserRepository(this.client);

  final GraphQLApiClient client;
  static String createUserOperationName = 'userCreate';
  static String updateReplyOperationName = 'userUpdate';
  static String createImageUserUrlOperationName = 'userImageUrlCreate';

  Future<SealedResult<QueryResult>> createUser(UserInput replyInput) async {
    final result = await client.query(gql(NFTMutation.userCreate),
        variables: replyInput.toJson(), operationName: createUserOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> updateUser(
      UserUpdateInput userUpdateInput) async {
    final result = await client.query(gql(NFTMutation.projectUpdate),
        variables: userUpdateInput.toJson(),
        operationName: updateReplyOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> createImageUserUrl(
      ImageUrlInput imageUrlInput) async {
    final result = await client.query(gql(NFTMutation.userImageUrlCreate),
        variables: imageUrlInput.toJson(),
        operationName: createImageUserUrlOperationName);
    return result;
  }
}
