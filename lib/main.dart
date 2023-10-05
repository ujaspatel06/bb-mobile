import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'Routes/pages.dart';
import 'Utils/constant.dart';
import 'theme/app_theme.dart';
import 'theme/theme_services.dart';

final box = GetStorage();

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  // final _configration =
  //     PurchasesConfiguration('appl_pisHDqLYItyDPGLsKTYMUcOwNrS');

  // await Purchases.configure(_configration);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  checkGetStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaleFactor: 1.0, boldText: false),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BudgetBuddie',
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeServices().theme,
          builder: EasyLoading.init(),
        ),
      );
    });
  }
}

void checkGetStorage() {
  if (box.read(GetStorageKey.themeMode) == null) {
    box.write(GetStorageKey.themeMode, false);
  }

  if (box.read(GetStorageKey.isFaceId) == null) {
    box.write(GetStorageKey.isFaceId, false);
  }

  if (box.read(GetStorageKey.isPinLogin) == null) {
    box.write(GetStorageKey.isPinLogin, false);
  }
}


