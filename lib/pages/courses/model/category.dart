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
  {"name": "MERN", 'courses': 7, 'image': "assets/images/marketing.png"},
  {"name": "Flutter Course", 'courses': 4, 'image': "assets/images/ux_design.png"},
  {"name": "Python", 'courses': 10,'image': "assets/images/photography.png"},
  {"name": "Java", 'courses': 5, 'image': "assets/images/business.png"},
    {"name": "Blockchain", 'courses': 9, 'image': "assets/images/img4.png"},
  {"name": "HTML/CSS", 'courses': 10, 'image': "assets/images/photography.png"},
    {"name": "Machine Learning", 'courses': 8, 'image': "assets/images/marketing.png"},
  {"name": "IOT", 'courses': 11, 'image': "assets/images/business.png"},
];
