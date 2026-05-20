import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/spell_model.dart';
import '../services/api_service.dart';

class SpellController extends GetxController {
  final RxList<SpellModel> spells = <SpellModel>[].obs;
  final RxList<SpellModel> favoriteSpells = <SpellModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  late Box _favBox;

  @override
  void onInit() {
    super.onInit();
    _favBox = Hive.box('favoritesBox');
    _loadFavoritesFromHive();
    fetchSpells();
  }

  Future<void> fetchSpells() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final data = await ApiService.getSpells();
      spells.assignAll(data);
    } catch (e) {
      errorMessage.value = 'Gagal load data: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void _loadFavoritesFromHive() {
    final raw = _favBox.get('favorites', defaultValue: []);
    final List<dynamic> list = raw is List ? raw : [];
    favoriteSpells.assignAll(
      list.map((e) => SpellModel.fromJson(Map<String, dynamic>.from(jsonDecode(e)))).toList(),
    );
  }

  void _saveFavoritesToHive() {
    final encoded = favoriteSpells.map((e) => jsonEncode(e.toJson())).toList();
    _favBox.put('favorites', encoded);
  }

  bool isFavorite(SpellModel spell) {
    return favoriteSpells.any((e) => e.index == spell.index);
  }

  void toggleFavorite(SpellModel spell) {
    if (isFavorite(spell)) {
      favoriteSpells.removeWhere((e) => e.index == spell.index);
      _saveFavoritesToHive();
      Get.snackbar(
        'Removed!',
        '${spell.spell} removed from the list',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFFF44336),
        colorText: const Color(0xFFFFFFFF),
        duration: const Duration(seconds: 2),
      );
    } else {
      favoriteSpells.add(spell);
      _saveFavoritesToHive();
      Get.snackbar(
        'Add!',
        '${spell.spell} successfully added to fav list',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFF4CAF50),
        colorText: const Color(0xFFFFFFFF),
        duration: const Duration(seconds: 2),
      );
    }
  }

  void removeFavorite(SpellModel spell) {
    favoriteSpells.removeWhere((e) => e.index == spell.index);
    _saveFavoritesToHive();
  }
}
