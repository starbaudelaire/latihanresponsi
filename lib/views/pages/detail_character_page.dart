import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/character_model.dart';

class DetailCharacterPage extends StatelessWidget {
  const DetailCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Character character = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  character.image,
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 260,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        size: 100,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            buildItem("Full Name", character.fullName),
            buildItem("Nickname", character.nickname),
            buildItem("Hogwarts House", character.hogwartsHouse),
            buildItem("Interpreted By", character.interpretedBy),
            buildItem("Birthdate", character.birthdate),
            buildItem("Children", character.children.toString()),
            buildItem("Nationality", character.nationality),
            buildItem("Eye Colour", character.eyeColour),
            buildItem("Hair Colour", character.hairColour),
            buildItem("Patronus", character.patronus),
            buildItem("Blood Status", character.bloodStatus),
            buildItem("Species", character.species),
            buildItem("Gender", character.gender),
            buildItem("Role", character.role),
            buildItem("Wand", character.wand),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String title, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value.isEmpty ? "-" : value,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}