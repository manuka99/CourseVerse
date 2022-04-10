import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  /// *Retrieve Data from Firestore */
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('Tutors').orderBy('timestamp').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            'id': doc.id,
            'name': doc['name'],
            'qualification': doc["qualification"],
            'education': doc["education"],
            'sub1': doc['sub1'],
            'sub2': doc['sub2'],
            'amount1': doc['amount1'],
            'amount2': doc['amount2'],
            'hours1': doc['hours1'],
            'hours2': doc['hours2'],
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  /// Create New tutor */
  Future<void> create(
      String name,
      String qualification,
      String education,
      String sub1,
      String sub2,
      String amount1,
      String amount2,
      String hours1,
      String hours2) async {
    try {
      await firestore.collection("Tutors").add({
        'name': name,
        'qualification': qualification,
        'education': education,
        'sub1': sub1,
        'sub2': sub2,
        'amount1': amount1,
        'amount2': amount2,
        'hours1': hours1,
        'hours2': hours2,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  /// Update Tutors */
  Future<void> update(
      String id,
      String name,
      String qualification,
      String education,
      String sub1,
      String sub2,
      String amount1,
      String amount2,
      String hours1,
      String hours2) async {
    try {
      await firestore.collection("Tutors").doc(id).update({
        'name': name,
        'qualification': qualification,
        'education': education,
        'sub1': sub1,
        'sub2': sub2,
        'amount1': amount1,
        'amount2': amount2,
        'hours1': hours1,
        'hours2': hours2
      });
    } catch (e) {
      print(e);
    }
  }

  /// Delete Tutor */
  Future<void> delete(String id) async {
    try {
      await firestore.collection("Tutors").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
