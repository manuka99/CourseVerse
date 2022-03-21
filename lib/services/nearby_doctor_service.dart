import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/doctor.dart';

class NearByDoctorsService {
  static final doctorsRef =
  FirebaseFirestore.instance.collection('nearby_doctors').withConverter<Doctor>(
    fromFirestore: (snapshot, _) => Doctor.fromJson(snapshot.data()!),
    toFirestore: (doctor, _) => doctor.toJson(),
  );

  NearByDoctorsService() {}

  static Future<Iterable<Doctor>> getDoctors() async {
    Iterable<Doctor> doctors = await doctorsRef
        .get()
        .then((snapshot) => snapshot.docs.map((doc) => doc.data()));

    return doctors;
  }


}
