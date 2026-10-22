import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _firestore.collection('users').add({
      ...userData,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
