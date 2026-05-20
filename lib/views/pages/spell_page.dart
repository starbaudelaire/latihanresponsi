import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/spell_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/app_routes.dart';

class SpellPage extends StatelessWidget {
  SpellPage({super.key});

  final SpellController controller = Get.put(SpellController());
  final AuthController authCtrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter Spells Gallery'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.favoriteSpell),
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: authCtrl.logout,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.spells.length,
          itemBuilder: (context, index) {
            final spell = controller.spells[index];
            final isFav = controller.isFavorite(spell.spell);
            return ListTile(
              leading: const Icon(Icons.book),
              title: Text(spell.spell),
              subtitle: Text(spell.use),
              trailing: IconButton(
                icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : null),
                onPressed: () => controller.toggleFavorite(spell),
              ),
            );
          },
        );
      }),
    );
  }
}