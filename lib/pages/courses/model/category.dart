class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'] as String, item['courses'] as int,
        item['image'] as String))
    .toList();

var categoriesData = [
  {"name": "MERN", 'courses': 15, 'image': "assets/images/marketing.png"},
  {"name": "Flutter", 'courses': 25, 'image': "assets/images/ux_design.png"},
  {"name": "Python", 'courses': 10,'image': "assets/images/photography.png"},
  {"name": "Java", 'courses': 12, 'image': "assets/images/business.png"},
    {"name": "Blockchain", 'courses': 22, 'image': "assets/images/ux_design.png"},
  {"name": "HTML/CSS", 'courses': 55, 'image': "assets/images/marketing.png"},
    {"name": "Machine Learning", 'courses': 26, 'image': "assets/images/business.png"},
  {"name": "IOT", 'courses': 15, 'image': "assets/images/photography.png"},
];
