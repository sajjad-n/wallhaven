abstract class GeneralConst {
  static const double designHeight = 800.0;
  static const double smallScreenMaxWidth = 800.0;
  static const Duration requestTimeOut = Duration(minutes: 1);
  static const Duration snackBarDuration = Duration(seconds: 4);
  static const String downloadDirectory = '/storage/emulated/0/Download';
}

enum ThumbnailTypes {
  large('large'),
  small('small'),
  original('original');

  const ThumbnailTypes(this.path);

  final String path;
}

enum SnackBarStyles { successful, error }
