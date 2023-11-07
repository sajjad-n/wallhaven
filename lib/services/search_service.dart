import 'dart:convert';

import '../data/models/dto/dto.dart';
import '../data/providers/providers.dart';

class SearchService {
  late HttpProvider httpProvider;

  SearchService() {
    httpProvider = HttpProvider();
  }

  Future<SearchResponse> search({required String page}) async {
    const path = 'api/v1/search';
    final queryParams = {'page': page};

    final response = await httpProvider.get(
      path: path,
      queryParams: queryParams,
    );

    return SearchResponse.fromJson(json.decode(response));
  }
}
