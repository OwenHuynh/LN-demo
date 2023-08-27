import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/graphql/nft_mutation.dart';
import 'package:lnsp/data/graphql/nft_query.dart';
import 'package:lnsp/data/remotes/base/base_response.dart';
import 'package:lnsp/data/remotes/graphql/client.dart';
import 'package:lnsp/data/remotes/graphql/client_provider.dart';
import 'package:lnsp/domain/entities/input/report_input.dart';
import 'package:lnsp/domain/entities/input/report_search_input.dart';
import 'package:lnsp/domain/entities/input/report_update_input.dart';
import 'package:lnsp/domain/repositories/base/base_repository.dart';

final reportRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return ReportRepository(client);
});

class ReportRepository extends BaseRepository {
  ReportRepository(this.client);

  final GraphQLApiClient client;
  static String reportOperationName = 'report';
  static String reportsOperationName = 'reports';
  static String createReportOperationName = 'reportCreate';
  static String updateReportOperationName = 'reportUpdate';

  Future<SealedResult<QueryResult>> getReports(
      ReportSearchInput reportSearchInput) async {
    final result = await client.query(gql(NFTQuery.reportsQuery),
        variables: reportSearchInput.toJson(),
        operationName: reportsOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> getReport(String reportId) async {
    final result = await client.query(gql(NFTQuery.reportQuery),
        variables: {"id": reportId}, operationName: reportOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> createReport(
      ReportInput reportInput) async {
    final result = await client.mutate(gql(NFTMutation.reportCreate),
        variables: reportInput.toJson(),
        operationName: createReportOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> updateReport(
      ReportUpdateInput reportUpdateInput) async {
    final result = await client.query(gql(NFTMutation.projectUpdate),
        variables: reportUpdateInput.toJson(),
        operationName: updateReportOperationName);
    return result;
  }
}
