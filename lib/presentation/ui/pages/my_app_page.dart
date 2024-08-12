import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/app_config.dart';
import 'package:my_quran/app/config/localizations/app_messages.dart';
import 'package:my_quran/app/config/routes/app_pages.dart';
import 'package:my_quran/app/config/routes/app_routes.dart';
import 'package:my_quran/app/config/styles/theme_styles.dart';
import 'package:my_quran/app/types/language_type.dart';
import 'package:my_quran/app/utils/helper/preference_helper.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppMessages(),
      locale: PreferenceHelper.language(),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: languageLocales,
      fallbackLocale: Locale(
        LanguageType.english.language,
        LanguageType.english.country,
      ),
      title: AppConfig.instance!.appName,
      initialRoute: AppRoutes.initialPage(),
      getPages: AppPages.pages,
      theme: ThemeStyles.app(),
      builder: EasyLoading.init(),
    );
  }
}
