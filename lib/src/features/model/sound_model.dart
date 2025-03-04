class SoundModel {
  final String id;
  final String name;
  final String category;
  final String audioUrl;
  final String imageUrl;
  final bool isPremium;

  SoundModel({
    required this.id,
    required this.name,
    required this.category,
    required this.audioUrl,
    required this.imageUrl,
    required this.isPremium,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category':category,
      'audioUrl': audioUrl,
      'imageUrl':imageUrl,
      'isPremium':isPremium
    };
  }
  factory SoundModel.fromJson(Map<String, dynamic> json) {
    return SoundModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      audioUrl: json['audioUrl'],
      imageUrl: json['imageUrl'],
      isPremium: json['isPremium'],
    );
  }
}
