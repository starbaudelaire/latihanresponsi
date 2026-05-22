import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
  Future<void> login(String username, String password) async {
    if (username == 'admin' && password == '123230137') {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool('isLogin', true);

      Get.offAllNamed(AppRoutes.character);

      Get.snackbar(
        'Success',
        'Login berhasil',
      );
    } else {
      Get.snackbar(
        'Failed',
        'Username atau password salah',
      );
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLogin', false);

    Get.offAllNamed(AppRoutes.login);

    Get.snackbar(
      'Logout',
      'Berhasil logout',
    );
  }
}