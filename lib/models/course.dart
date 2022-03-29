class Course{
  late String id;
  late String name;
  late String specialization;
  late String rating;
  late String imageUrl;

  Course({required this.id, required this.name, required this.specialization, required this.rating, required this.imageUrl});

  static Course fromJson(Map<String, Object?> json) {
    return new Course(
      id: json['id']! as String,
      name: json['name']! as String,
      specialization: json['specialization']! as String,
      rating: json['rating']! as String,
      imageUrl: json['imageUrl']! as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'rating': rating,
      'imageUrl': imageUrl,
    };
  }

}