import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/graphql/nft_mutation.dart';
import 'package:lnsp/data/remotes/base/base_response.dart';
import 'package:lnsp/data/remotes/graphql/client.dart';
import 'package:lnsp/data/remotes/graphql/client_provider.dart';
import 'package:lnsp/domain/entities/input/image_url_input.dart';
import 'package:lnsp/domain/entities/input/invest_input.dart';
import 'package:lnsp/domain/repositories/base/base_repository.dart';

final nftRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return NftRepository(client);
});

class NftRepository extends BaseRepository {
  NftRepository(this.client);

  final GraphQLApiClient client;
  static String nftInvestOperationName = 'nftInvest';
  static String createNftImageUrlOperationName = 'nftImageUrlCreate';

  Future<SealedResult<QueryResult>> nftInvest(InvestInput nftInput) async {
    final result = await client.mutate(gql(NFTMutation.nftInvest),
        variables: nftInput.toJson(), operationName: nftInvestOperationName);
    return result;
  }

  Future<SealedResult<QueryResult>> createNftImageUrl(
      ImageUrlInput imageUrlInput) async {
    final result = await client.mutate(gql(NFTMutation.nftImageUrlCreate),
        variables: imageUrlInput.toJson(),
        operationName: createNftImageUrlOperationName);
    return result;
  }
}
