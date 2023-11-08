abstract class GeneralConst {
  static const double designWidth = 390.0;
  static const double smallScreenMaxWidth = 600.0;
  static const Duration requestTimeOut = Duration(minutes: 1);
  static const Duration snackBarDuration = Duration(seconds: 4);
  static const Duration listItemAnimDuration = Duration(milliseconds: 500);
  static const Duration startAnimDelay = Duration(milliseconds: 100);
}

enum ThumbnailTypes {
  large('large'),
  small('small'),
  original('original');

  const ThumbnailTypes(this.path);

  final String path;
}
