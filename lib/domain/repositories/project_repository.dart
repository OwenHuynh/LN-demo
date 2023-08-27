import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/graphql/nft_mutation.dart';
import 'package:lnsp/data/graphql/nft_query.dart';
import 'package:lnsp/data/remotes/base/base_response.dart';
import 'package:lnsp/data/remotes/graphql/client.dart';
import 'package:lnsp/data/remotes/graphql/client_provider.dart';
import 'package:lnsp/domain/entities/input/project_input.dart';
import 'package:lnsp/domain/entities/input/project_liked_input.dart';
import 'package:lnsp/domain/entities/input/project_search_input.dart';
import 'package:lnsp/domain/entities/input/project_update_input.dart';
import 'package:lnsp/domain/repositories/base/base_repository.dart';

final projectRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return ProjectRepository(client);
});

class ProjectRepository extends BaseRepository {
  ProjectRepository(this.client);

  final GraphQLApiClient client;
  static String projectOperationName = 'project';
  static String projectsOperationName = 'projects';

  static String createProjectOperationName = 'projectCreate';
  static String updateProjectOperationName = 'projectUpdate';
  static String likedProjectOperationName = 'projectLiked';

  Future<SealedResult<QueryResult>> getProjects(
      ProjectSearchInput projectSearchInput) async {
    final result = await client.query(gql(NFTQuery.projectsQuery),
        variables: projectSearchInput.toJson(),
        operationName: projectOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> getProject(
      ProjectSearchInput projectSearchInput) async {
    final result = await client.query(gql(NFTQuery.projectQuery),
        variables: projectSearchInput.toJson(),
        operationName: projectsOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> createProject(
      ProjectInput projectInput) async {
    final result = await client.mutate(gql(NFTMutation.projectCreate),
        variables: projectInput.toJson(),
        operationName: createProjectOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> updateProject(
      ProjectUpdateInput projectUpdateInput) async {
    final result = await client.mutate(gql(NFTMutation.projectUpdate),
        variables: projectUpdateInput.toJson(),
        operationName: updateProjectOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> projectLiked(
      ProjectLikedInput projectUpdateInput) async {
    final result = await client.mutate(gql(NFTMutation.projectLiked),
        variables: projectUpdateInput.toJson(),
        operationName: likedProjectOperationName);
    return result;
  }
}
