import 'models.dart';

class Details {
  String? id;
  String? url;
  String? shortUrl;
  Uploader? uploader;
  int? views;
  int? favorites;
  String? source;
  String? purity;
  String? category;
  int? dimensionX;
  int? dimensionY;
  String? resolution;
  String? ratio;
  int? fileSize;
  String? fileType;
  String? createdAt;
  List<String>? colors;
  String? path;
  Thumbnail? thumbs;
  List<Tag>? tags;

  Details({
    this.id,
    this.url,
    this.shortUrl,
    this.uploader,
    this.views,
    this.favorites,
    this.source,
    this.purity,
    this.category,
    this.dimensionX,
    this.dimensionY,
    this.resolution,
    this.ratio,
    this.fileSize,
    this.fileType,
    this.createdAt,
    this.colors,
    this.path,
    this.thumbs,
    this.tags,
  });

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    shortUrl = json['short_url'];
    uploader =
        json['uploader'] != null ? Uploader.fromJson(json['uploader']) : null;
    views = json['views'];
    favorites = json['favorites'];
    source = json['source'];
    purity = json['purity'];
    category = json['category'];
    dimensionX = json['dimension_x'];
    dimensionY = json['dimension_y'];
    resolution = json['resolution'];
    ratio = json['ratio'];
    fileSize = json['file_size'];
    fileType = json['file_type'];
    createdAt = json['created_at'];
    colors = json['colors'].cast<String>();
    path = json['path'];
    thumbs = json['thumbs'] != null ? Thumbnail.fromJson(json['thumbs']) : null;
    if (json['tags'] != null) {
      tags = <Tag>[];
      json['tags'].forEach((v) {
        tags!.add(Tag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['short_url'] = shortUrl;
    if (uploader != null) {
      data['uploader'] = uploader!.toJson();
    }
    data['views'] = views;
    data['favorites'] = favorites;
    data['source'] = source;
    data['purity'] = purity;
    data['category'] = category;
    data['dimension_x'] = dimensionX;
    data['dimension_y'] = dimensionY;
    data['resolution'] = resolution;
    data['ratio'] = ratio;
    data['file_size'] = fileSize;
    data['file_type'] = fileType;
    data['created_at'] = createdAt;
    data['colors'] = colors;
    data['path'] = path;
    if (thumbs != null) {
      data['thumbs'] = thumbs!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
