import 'package:get/get.dart';
import 'package:my_quran/app/config/routes/app_routes.dart';
import 'package:my_quran/presentation/get/detail/detail_binding.dart';
import 'package:my_quran/presentation/get/home/home_binding.dart';
import 'package:my_quran/presentation/get/interpretation/interpretation_binding.dart';
import 'package:my_quran/presentation/ui/pages/detail/detail_page.dart';
import 'package:my_quran/presentation/ui/pages/home/home_page.dart';
import 'package:my_quran/presentation/ui/pages/interpretation/interpretation_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRoutes.interpretation,
      page: () => const InterpretationPage(),
      binding: InterpretationBinding(),
    ),
  ];
}
