import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/spell_model.dart';
import '../services/api_service.dart';
import '../services/notification_service.dart';

class SpellController extends GetxController {
  final RxList<SpellModel> spells = <SpellModel>[].obs;
  final RxList<SpellModel> favoriteSpells = <SpellModel>[].obs;

  final RxBool isLoading = false.obs;

  late Box favBox;

  @override
  void onInit() {
    super.onInit();

    favBox = Hive.box('favoritesBox');

    loadFavorites();
    fetchSpells();
  }

  Future<void> fetchSpells() async {
    try {
      isLoading.value = true;

      final result = await ApiService.getSpells();

      spells.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', 'Failed fetch spells');
    } finally {
      isLoading.value = false;
    }
  }

  void loadFavorites() {
    final data = favBox.get('favorites');

    if (data != null) {
      favoriteSpells.assignAll(
        (data as List)
            .map(
              (e) =>
                  SpellModel.fromJson(Map<String, dynamic>.from(jsonDecode(e))),
            )
            .toList(),
      );
    }
  }

  void saveFavorites() {
    final data = favoriteSpells.map((e) => jsonEncode(e.toJson())).toList();

    favBox.put('favorites', data);
  }

  bool isFavorite(SpellModel spell) {
    return favoriteSpells.any((item) => item.spell == spell.spell);
  }

  void toggleFavorite(SpellModel spell) {
    if (isFavorite(spell)) {
      favoriteSpells.removeWhere((item) => item.spell == spell.spell);

      Get.snackbar('Removed', '${spell.spell} removed from favorite');
    } else {
      favoriteSpells.add(spell);

      Get.snackbar('Added', '${spell.spell} added to favorite');
    }

    saveFavorites();

    favoriteSpells.refresh();
  }

  void removeFavorite(SpellModel spell) {
    favoriteSpells.removeWhere((item) => item.spell == spell.spell);

    saveFavorites();

    NotificationService.showNotification(
      'Favorite Removed',
      '${spell.spell} removed from favorite list',
    );

    Get.snackbar('Deleted', '${spell.spell} deleted from favorite');
  }
}
