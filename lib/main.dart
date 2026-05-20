import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // HARUS SAMA DENGAN YANG DIPAKAI DI CONTROLLER
  await Hive.openBox('favoritesBox');

  await NotificationService.init();

  final prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;

  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harry Potter App',
      initialRoute: isLogin ? AppRoutes.character : AppRoutes.login,
      getPages: AppPages.routes,
    );
  }
}