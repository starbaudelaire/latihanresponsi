class SpellModel {
  final String spell;
  final String use;
  final int index;

  SpellModel({
    required this.spell,
    required this.use,
    required this.index,
  });

  factory SpellModel.fromJson(Map<String, dynamic> json) {
    return SpellModel(
      spell: json['spell'] ?? '',
      use: json['use'] ?? '',
      index: json['index'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spell': spell,
      'use': use,
      'index': index,
    };
  }
}
