import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:my_quran/app/config/app_config.dart';
import 'package:my_quran/app/config/styles/system_styles.dart';
import 'package:my_quran/app/core/network/network_info.dart';
import 'package:my_quran/data/providers/database/database_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'presentation/ui/pages/my_app_page.dart';
import 'presentation/ui/widgets/base/communication/base_loading_view.dart';

void main() async {
  await _initMyApp();

  SystemStyles.basic().then(
    (_) => runApp(
      const MyAppPage(),
    ),
  );
}

Future _initMyApp() async {
  //ensureInitialized for initialize device orientation
  WidgetsFlutterBinding.ensureInitialized();

  //flavor
  AppConfig(
    flavor: Flavor.development,
  );

  //easy loading
  BaseLoadingView.init();

  //external
  Get.put(InternetConnection());
  Get.put(
    NetworkInfoImpl(
      Get.find<InternetConnection>(),
    ),
  );
  await Get.putAsync<Database>(() => DatabaseProvider.instance.localDb);
}
