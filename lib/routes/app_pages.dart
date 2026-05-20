import 'package:get/get.dart';
import 'app_routes.dart';

import '../views/pages/login_page.dart';
import '../views/pages/character_page.dart';
import '../views/pages/detail_character_page.dart';
import '../views/pages/spell_page.dart';
import '../views/pages/favorite_spell_page.dart';

import '../bindings/auth_binding.dart';
import '../bindings/character_binding.dart';
import '../bindings/spell_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.character,
      page: () => CharacterPage(),
      binding: CharacterBinding(),
    ),
    GetPage(
      name: AppRoutes.detailCharacter,
      page: () => DetailCharacterPage(),
    ),
    GetPage(
      name: AppRoutes.spell,
      page: () => SpellPage(),
      binding: SpellBinding(),
    ),
    GetPage(
      name: AppRoutes.favoriteSpell,
      page: () => FavoriteSpellPage(),
    ),
  ];
}