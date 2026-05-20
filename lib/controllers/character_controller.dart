import 'package:get/get.dart';
import '../models/character_model.dart';
import '../services/api_service.dart';

class CharacterController extends GetxController {
  final RxList<CharacterModel> characters = <CharacterModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final data = await ApiService.getCharacters();
      characters.assignAll(data);
    } catch (e) {
      errorMessage.value = 'Gagal load data: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
