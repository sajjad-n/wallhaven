import '../models.dart';
import 'dto.dart';

class SearchResponse {
  ResponseSchema? schema;
  List<Wallpaper>? wallpapers;

  SearchResponse({this.schema, this.wallpapers});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    schema = ResponseSchema.fromJson(json);
    if (schema?.data != null) {
      wallpapers = <Wallpaper>[];
      schema?.data.forEach((v) {
        wallpapers!.add(Wallpaper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final base = schema?.toJson() ?? {};
    var data = [];
    if (wallpapers != null) {
      data = wallpapers!.map((v) => v.toJson()).toList();
    }
    base['data'] = data;
    return base;
  }
}
