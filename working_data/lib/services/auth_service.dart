import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    UserCredential? credential;

    try {
      // Step 1: Firebase Authentication mein account create karo.
      credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final User? user = credential.user;

      if (user == null) {
        throw Exception('User account create nahi hua.');
      }

      // Step 2: Auth se mili UID ko profile mein use karo.
      final UserModel updatedUser = UserModel(
        uid: user.uid,
        fullName: userModel.fullName,
        username: userModel.username,
        email: user.email ?? email.trim(),
        mobile: userModel.mobile,
        dateOfBirth: userModel.dateOfBirth,
        gender: userModel.gender,
        country: userModel.country,
        state: userModel.state,
        city: userModel.city,
        pincode: userModel.pincode,
        addressLine1: userModel.addressLine1,
        addressLine2: userModel.addressLine2,
        qualification: userModel.qualification,
        collegeName: userModel.collegeName,
        createdAt: userModel.createdAt,
      );

      // Step 3: Firestore mein user profile save karo.
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(updatedUser.toMap());
    } catch (e) {
      // Agar profile save karne mein error aaye,
      // toh aadha bana account clean up karne ki koshish karo jisse data  khali rahe
      if (credential?.user != null) {
        try {
          await credential!.user!.delete();
        } catch (_) {
          // Cleanup fail hone par original error preserve hoga.
        }
      }

      rethrow;
    }
  }
}
