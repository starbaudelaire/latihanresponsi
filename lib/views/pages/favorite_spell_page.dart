import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/spell_controller.dart';

class FavoriteSpellPage extends StatelessWidget {
  FavoriteSpellPage({super.key});

  final SpellController controller = Get.find<SpellController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Spell')),
      body: Obx(() {
        final favSpells = controller.getFavoriteSpells();
        if (favSpells.isEmpty) {
          return const Center(child: Text('No favorite spells'));
        }
        return ListView.builder(
          itemCount: favSpells.length,
          itemBuilder: (context, index) {
            final spell = favSpells[index];
            return ListTile(
              leading: const Icon(Icons.book),
              title: Text(spell.spell),
              subtitle: Text(spell.use),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.toggleFavorite(spell),
              ),
            );
          },
        );
      }),
    );
  }
}