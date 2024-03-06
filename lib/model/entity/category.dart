class Category {
  final int id;
  final String name;
  final String thumbnail;

  Category({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
    };
  }
}