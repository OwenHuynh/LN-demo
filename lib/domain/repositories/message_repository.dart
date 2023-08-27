import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/graphql/nft_mutation.dart';
import 'package:lnsp/data/graphql/nft_query.dart';
import 'package:lnsp/data/remotes/base/base_response.dart';
import 'package:lnsp/data/remotes/graphql/client.dart';
import 'package:lnsp/data/remotes/graphql/client_provider.dart';
import 'package:lnsp/domain/entities/input/message_input.dart';
import 'package:lnsp/domain/entities/input/message_update_input.dart';
import 'package:lnsp/domain/repositories/base/base_repository.dart';

final messageRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return MessageRepository(client);
});

class MessageRepository extends BaseRepository {
  MessageRepository(this.client);

  final GraphQLApiClient client;
  static String createMessageProjectOperationName = 'messageCreateInProject';
  static String createMessageReportOperationName = 'messageCreateInReport';
  static String updateMessageOperationName = 'messageUpdate';
  static String messageOperationName = 'message';
  static String reportMessagesOperationName = 'reportMessages';
  static String getProjectMessagesOperationName = 'projectMessages';

  Future<SealedResult<QueryResult>> getMessagesById(String messageId) async {
    final result = await client.query(gql(NFTQuery.messageQuery),
        variables: {'messageId': messageId},
        operationName: messageOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> createMessageProject(
      MessageInput messageInput) async {
    final result = await client.mutate(gql(NFTMutation.messageCreateInProject),
        variables: messageInput.toJson(),
        operationName: createMessageProjectOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> createMessageReport(
      MessageInput messageInput) async {
    final result = await client.mutate(gql(NFTMutation.messageCreateInReport),
        variables: messageInput.toJson(),
        operationName: createMessageReportOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> updateMessage(
      MessageUpdateInput messageUpdateInput) async {
    final result = await client.mutate(gql(NFTMutation.messageUpdated),
        variables: messageUpdateInput.toJson(),
        operationName: updateMessageOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> getMessageByProjectId(
      String projectId) async {
    final result = await client.query(gql(NFTQuery.projectMessagesQuery),
        variables: {"projectId": projectId},
        operationName: getProjectMessagesOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> getMessageByReportId(
      String reportId) async {
    final result = await client.query(gql(NFTQuery.reportMessagesQuery),
        variables: {"reportId": reportId},
        operationName: reportMessagesOperationName);
    return result;
  }
}
