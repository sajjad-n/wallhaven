import 'dart:convert';

import '../data/models/dto/dto.dart';
import '../data/providers/providers.dart';

class DetailsService {
  late HttpProvider httpProvider;

  DetailsService() {
    httpProvider = HttpProvider();
  }

  Future<DetailsResponse> details({required String id}) async {
    final path = 'api/v1/w/$id';

    final response = await httpProvider.get(path: path);

    return DetailsResponse.fromJson(json.decode(response));
  }
}
