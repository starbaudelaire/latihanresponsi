import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/spell_controller.dart';
import '../../routes/app_routes.dart';

class SpellPage extends StatelessWidget {
  SpellPage({super.key});

  final SpellController controller = Get.find<SpellController>();
  final AuthController authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spells View'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.favoriteSpell),
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: authCtrl.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: controller.spells.length,
          itemBuilder: (context, index) {
            final spell = controller.spells[index];
            final isFavorite = controller.isFavorite(spell);

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
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    controller.toggleFavorite(spell);
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