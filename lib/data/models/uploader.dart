import 'models.dart';

class Uploader {
  String? username;
  String? group;
  Avatar? avatar;

  Uploader({this.username, this.group, this.avatar});

  Uploader.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    group = json['group'];
    avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['group'] = group;
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    return data;
  }
}
