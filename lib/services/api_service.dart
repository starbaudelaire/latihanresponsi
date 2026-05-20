import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';
import '../models/spell_model.dart';

class ApiService {
  static const String _baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  static Future<List<CharacterModel>> getCharacters() async {
    final response = await http.get(Uri.parse('$_baseUrl/characters'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal fetch characters');
    }
  }

  static Future<List<SpellModel>> getSpells() async {
    final response = await http.get(Uri.parse('$_baseUrl/spells'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => SpellModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal fetch spells');
    }
  }
}
