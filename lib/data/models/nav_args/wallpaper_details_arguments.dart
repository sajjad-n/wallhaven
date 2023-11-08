import '../models.dart';

class WallpaperDetailsArguments {
  Wallpaper? wallpaper;

  WallpaperDetailsArguments({this.wallpaper});

  WallpaperDetailsArguments.fromJson(Map<String, dynamic> json) {
    wallpaper = Wallpaper.fromJson(json['wallpaper']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wallpaper != null) {
      data['wallpaper'] = wallpaper!.toJson();
    }
    return data;
  }
}
