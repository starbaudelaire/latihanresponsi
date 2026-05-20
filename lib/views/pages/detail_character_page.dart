import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/character_model.dart';

class DetailCharacterPage extends StatelessWidget {
  const DetailCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Character character = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(character.fullName)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.network(character.image, height: 200, errorBuilder: (c, e, s) => const Icon(Icons.person, size: 200)),
            const SizedBox(height: 20),
            Text('Name: ${character.fullName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Nickname: ${character.nickname}'),
            Text('House: ${character.hogwartsHouse}'),
            Text('Actor: ${character.interpretedBy}'),
            Text('Birthdate: ${character.birthdate}'),
          ],
        ),
      ),
    );
  }
}