abstract class GeneralTranslations {
  static const String error = 'error';
  static const String retry = 'retry';
  static const String requestTimeOut = 'request_time_out';
  static const String noInternetConnection = 'no_internet_connection';
  static const String wallpaperDownloaded = 'wallpaper_downloaded';
  static const String permissionNotGranted = 'permission_not_granted';

  static const Map<String, String> enUS = {
    error: 'Something went wrong.',
    retry: 'Retry',
    requestTimeOut:
        'Request timed out. Please check your connection and try again.',
    noInternetConnection:
        'No internet connection. Please connect and try again.',
    wallpaperDownloaded: 'The wallpaper was downloaded successfully.',
    permissionNotGranted:
        'Storage permission is necessary for downloading wallpapers.',
  };
}
