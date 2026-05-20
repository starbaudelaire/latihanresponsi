import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/spell_controller.dart';

class FavoriteSpellPage extends StatelessWidget {
  FavoriteSpellPage({super.key});

  final SpellController controller = Get.find<SpellController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Spells'),
      ),
      body: Obx(() {
        if (controller.favoriteSpells.isEmpty) {
          return const Center(
            child: Text('No Favorite Spell'),
          );
        }

        return ListView.builder(
          itemCount: controller.favoriteSpells.length,
          itemBuilder: (context, index) {
            final spell = controller.favoriteSpells[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.auto_fix_high),
                ),
                title: Text(spell.spell),
                subtitle: Text(spell.use),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    controller.removeFavorite(spell);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}