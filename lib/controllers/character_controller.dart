import 'package:get/get.dart';

import '../models/character_model.dart';
import '../services/api_service.dart';

class CharacterController extends GetxController {
  final RxList<Character> characters = <Character>[].obs;

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      isLoading.value = true;

      final result = await ApiService.getCharacters();

      characters.assignAll(result);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed fetch character',
      );
    } finally {
      isLoading.value = false;
    }
  }
}