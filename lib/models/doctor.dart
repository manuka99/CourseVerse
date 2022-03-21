class Doctor{
  late String id;
  late String name;
  late String skill;
  late String rating;
  late String imageUrl;

  Doctor({required this.id, required this.name, required this.skill, required this.rating, required this.imageUrl});

  static Doctor fromJson(Map<String, Object?> json) {
    return new Doctor(
      id: json['id']! as String,
      name: json['name']! as String,
      skill: json['skill']! as String,
      rating: json['rating']! as String,
      imageUrl: json['imageUrl']! as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'skill': skill,
      'rating': rating,
      'imageUrl': imageUrl,
    };
  }

}