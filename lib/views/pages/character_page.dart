import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/character_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/app_routes.dart';

class CharacterPage extends StatelessWidget {
  CharacterPage({super.key});

  final CharacterController controller = Get.find<CharacterController>();
  final AuthController authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.spell),
            icon: const Icon(Icons.auto_awesome),
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
          itemCount: controller.characters.length,
          itemBuilder: (context, index) {
            final character = controller.characters[index];
            return ListTile(
              leading: Image.network(character.image, width: 50, height: 50, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.person)),
              title: Text(character.fullName),
              subtitle: Text(character.interpretedBy),
              onTap: () => Get.toNamed(AppRoutes.detailCharacter, arguments: character),
            );
          },
        );
      }),
    );
  }
}