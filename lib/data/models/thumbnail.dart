class Thumbnail {
  String? large;
  String? original;
  String? small;

  Thumbnail({this.large, this.original, this.small});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    original = json['original'];
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['large'] = large;
    data['original'] = original;
    data['small'] = small;
    return data;
  }
}
