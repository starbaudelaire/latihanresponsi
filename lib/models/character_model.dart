class CharacterModel {
  final String fullName;
  final String nickname;
  final String hogwartsHouse;
  final String interpretedBy;
  final List<String> children;
  final String image;
  final String birthdate;
  final int index;

  final String ancestry;
  final String species;
  final String gender;
  final String eyeColour;
  final String hairColour;
  final String wand;

  CharacterModel({
    required this.fullName,
    required this.nickname,
    required this.hogwartsHouse,
    required this.interpretedBy,
    required this.children,
    required this.image,
    required this.birthdate,
    required this.index,
    required this.ancestry,
    required this.species,
    required this.gender,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      fullName: json['fullName'] ?? '',
      nickname: json['nickname'] ?? '',
      hogwartsHouse: json['hogwartsHouse'] ?? '',
      interpretedBy: json['interpretedBy'] ?? '',
      children: List<String>.from(json['children'] ?? []),
      image: json['image'] ?? '',
      birthdate: json['birthdate'] ?? '',
      index: json['index'] ?? 0,

      ancestry: json['ancestry'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      eyeColour: json['eyeColour'] ?? '',
      hairColour: json['hairColour'] ?? '',
      wand: json['wand'] ?? '',
    );
  }
}