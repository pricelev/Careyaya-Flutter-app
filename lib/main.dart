import 'package:careyaya/constants/routes.dart';
import 'package:careyaya/constants/themes.dart';
import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/controllers/language.controller.dart';
// import 'package:careyaya/controllers/location/location.controller.dart';
import 'package:careyaya/controllers/theme.controller.dart';
import 'package:careyaya/localizations.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

FirebaseAnalytics analytics;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<AuthController>(AuthController(), permanent: true);
  Get.put<FirestoreController>(FirestoreController());
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  // Get.put<LocationController>(LocationController());
  analytics = FirebaseAnalytics();
  runApp(CaregiversApp());
}

class CaregiversApp extends StatelessWidget {
  // The app root.
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetMaterialApp(
      locale: AppLocalizations.languages.keys.first,
      localizationsDelegates: [
        const AppLocalizationsDelegate(), // Custom delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:
          AppLocalizations.languages.keys.toList(), // <- Supported locales,
      debugShowCheckedModeBanner: true,
      textDirection: TextDirection.ltr,
      title: 'Caregivers',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/login',
      getPages: AppRoutes.routes,
      defaultTransition: Transition.noTransition,
    );
  }
}
