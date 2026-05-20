import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/character_controller.dart';
import '../../routes/app_routes.dart';

class CharacterPage extends StatelessWidget {
  CharacterPage({super.key});

  final CharacterController controller = Get.find<CharacterController>();

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character View'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.spell);
            },
            icon: const Icon(Icons.auto_fix_high),
          ),
          IconButton(
            onPressed: authController.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.characters.length,
          itemBuilder: (context, index) {
            final character = controller.characters[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: character.image.isNotEmpty
                      ? NetworkImage(character.image)
                      : null,
                  child: character.image.isEmpty
                      ? const Icon(Icons.person)
                      : null,
                ),
                title: Text(character.fullName),
                subtitle: Text(character.hogwartsHouse),
                onTap: () {
                  Get.toNamed(AppRoutes.detailCharacter, arguments: character);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
