abstract class AppRoutes {
  static const String root = '/';

  static const String home = '/home';
  static const String detail = '/detail';
  static const String interpretation = '/interpretation';

  ///function to determine which route will be executed first
  static String? initialPage() {
    return home;
  }
}
