class Avatar {
  String? s200px;
  String? s128px;
  String? s32px;
  String? s20px;

  Avatar({this.s200px, this.s128px, this.s32px, this.s20px});

  Avatar.fromJson(Map<String, dynamic> json) {
    s200px = json['200px'];
    s128px = json['128px'];
    s32px = json['32px'];
    s20px = json['20px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['200px'] = s200px;
    data['128px'] = s128px;
    data['32px'] = s32px;
    data['20px'] = s20px;
    return data;
  }
}
