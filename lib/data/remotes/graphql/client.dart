import 'package:flutter/foundation.dart';
import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/config/app_config.dart';
import 'package:lnsp/data/locals/app_preferences/app_preferences.dart';
import 'package:lnsp/data/remotes/base/base_response.dart';
import 'package:lnsp/data/remotes/graphql/session_controller.dart';

final ProviderContainer container = ProviderContainer();

class GraphQLApiClient {
  GraphQLApiClient()
      : _graphQLClient = (() async {
          final cookie = await AppPreferences().getSession();
          final isNotEmpty = cookie?.isNotEmpty;
          final headers = isNotEmpty ?? false
              ? {'x-token': 'CUSTOMER', 'cookie': "$cookie;"}
              : {'x-token': 'CUSTOMER'};
          return ValueNotifier(GraphQLClient(
              cache: GraphQLCache(
                store: HiveStore(),
              ),
              link: HttpLink(
                AppConfig.getBaseUrl(),
                defaultHeaders: headers,
              )));
        })();
  late Future<ValueNotifier<GraphQLClient>> _graphQLClient;

  Future<ValueNotifier<GraphQLClient>> get graphQLClient => _graphQLClient;

  Future<SealedResult<QueryResult>> query(DocumentNode query,
      {Map<String, dynamic> variables = const {},
      String operationName = ""}) async {
    await _graphQLClient.then((value) async {
      final data = value.value.link as HttpLink;
      // ignore: lines_longer_than_80_chars
      data.defaultHeaders['cookie'] =
          "${container.read(sessionControllerProvider.notifier).session};";
    });
    final QueryResult result = await _graphQLClient.then((api) {
      return api.value.query(QueryOptions(
          document: query,
          variables: variables,
          operationName: operationName,
          fetchPolicy: FetchPolicy.noCache));
    });
    if (result.hasException) {
      // エラー処理
      final String errorMessage =
          parseOperationGraphQLException(result.exception);
      return Future.value(Error(errorMessage));
    }
    final cookie =
        result.context.entry<HttpLinkResponseContext>()?.headers!['set-cookie'];
    if (cookie != null) {
      if (cookie.isNotEmpty) {
        final id = cookie.split(";")[0];
        await container.read(sessionControllerProvider.notifier).setSession(id);
        print(await AppPreferences().getSession());
      }
    }
    return Future.value(Success(result));
  }

  Future<SealedResult<QueryResult>> mutate(DocumentNode mutation,
      {Map<String, dynamic>? variables, String? operationName}) async {
    await _graphQLClient.then((value) async {
      final link = value.value.link as HttpLink;
      // ignore: lines_longer_than_80_chars
      link.defaultHeaders['cookie'] =
          "${container.read(sessionControllerProvider.notifier).session};";
    });
    final QueryResult result = await _graphQLClient.then((api) {
      return api.value.mutate(MutationOptions(
          document: mutation,
          variables: variables ?? {},
          fetchPolicy: FetchPolicy.noCache));
    });
    if (result.hasException) {
      // エラー処理
      final String errorMessage =
          parseOperationGraphQLException(result.exception);
      return Future.value(Error(errorMessage));
    }
    final cookie =
        result.context.entry<HttpLinkResponseContext>()?.headers!['set-cookie'];
    if (cookie!.isNotEmpty) {
      final id = cookie.split(";")[0];
      if (id != AppPreferences().getSession()) {
        await container.read(sessionControllerProvider.notifier).setSession(id);
      }
      print(await AppPreferences().getSession());
    }
    return Future.value(Success(result));
  }

  String parseOperationGraphQLException(OperationException? error) {
    if (error == null) {
      return 'Unknown error';
    }
    if (error.linkException != null) {
      final exception = error.linkException;

      if (exception is NetworkException) {
        return 'Failed to connect to server';
      } else {
        return exception.toString();
      }
    }
    if (error.graphqlErrors.isNotEmpty) {
      final errors = error.graphqlErrors;
      return errors.first.message;
    }
    return 'Unknown error';
  }
}
