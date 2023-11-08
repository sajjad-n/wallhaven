class Tag {
  int? id;
  String? name;
  String? alias;
  int? categoryId;
  String? category;
  String? purity;
  String? createdAt;

  Tag({
    this.id,
    this.name,
    this.alias,
    this.categoryId,
    this.category,
    this.purity,
    this.createdAt,
  });

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    categoryId = json['category_id'];
    category = json['category'];
    purity = json['purity'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alias'] = alias;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['purity'] = purity;
    data['created_at'] = createdAt;
    return data;
  }
}
