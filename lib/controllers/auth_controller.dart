import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  // Hardcoded credentials
  static const String _validUsername = 'admin';
  static const String _validPassword = '12345';

  final RxBool isLoading = false.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 500));

    if (username == _validUsername && password == _validPassword) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin', true);

      Get.snackbar(
        'Success!',
        'Login Successful',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFF4CAF50),
        colorText: const Color(0xFFFFFFFF),
        duration: const Duration(seconds: 2),
      );

      await Future.delayed(const Duration(milliseconds: 800));
      Get.offAllNamed(AppRoutes.character);
    } else {
      Get.snackbar(
        'Failed!',
        'Invalid username or password',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFFF44336),
        colorText: const Color(0xFFFFFFFF),
        duration: const Duration(seconds: 2),
      );
    }

    isLoading.value = false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);

    Get.offAllNamed(AppRoutes.login);

    Get.snackbar(
      'Success!',
      'Logged out Successfully',
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF4CAF50),
      colorText: const Color(0xFFFFFFFF),
      duration: const Duration(seconds: 2),
    );
  }
}
