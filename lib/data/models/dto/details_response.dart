import '../models.dart';
import 'dto.dart';

class DetailsResponse {
  ResponseSchema? schema;
  Details? details;

  DetailsResponse({this.schema, this.details});

  DetailsResponse.fromJson(Map<String, dynamic> json) {
    schema = ResponseSchema.fromJson(json);
    details = schema?.data != null ? Details.fromJson(schema?.data) : null;
  }

  Map<String, dynamic> toJson() {
    final base = schema?.toJson() ?? {};
    var data = {};
    if (details != null) {
      data = details!.toJson();
    }
    base['data'] = data;
    return base;
  }
}
