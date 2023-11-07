class ResponseSchema {
  dynamic data;
  Meta? meta;
  String? error;

  ResponseSchema({
    this.data,
    this.meta,
    this.error,
  });

  ResponseSchema.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['data'] = data;
    if (meta != null) {
      json['meta'] = meta!.toJson();
    }
    json['error'] = error;
    return json;
  }
}

class Meta {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  Meta({this.currentPage, this.lastPage, this.perPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['per_page'] = perPage;
    data['total'] = total;
    return data;
  }
}
