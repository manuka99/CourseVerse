import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/course.dart';

class CourseService {
  static final coursesRef =
  FirebaseFirestore.instance.collection('course').withConverter<Course>(
    fromFirestore: (snapshot, _) => Course.fromJson(snapshot.data()!),
    toFirestore: (course, _) => course.toJson(),
  );

  CourseService() {}

  static Future<Iterable<Course>> getDoctors() async {
    Iterable<Course> courses = await coursesRef
        .get()
        .then((snapshot) => snapshot.docs.map((doc) => doc.data()));

    return courses;
  }


}
