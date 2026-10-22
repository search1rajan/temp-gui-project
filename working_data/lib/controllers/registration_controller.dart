import '../services/firestore_service.dart';

class RegistrationController {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> register({
    required String fullName,
    required String username,
    required String email,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String dateOfBirth,
    required String gender,
    required String country,
    required String state,
    required String city,
    required String pincode,
    required String addressLine1,
    required String addressLine2,
    required String qualification,
    required String collegeName,
    required bool isAgreed,
  }) async {
    if (fullName.trim().isEmpty ||
        username.trim().isEmpty ||
        email.trim().isEmpty ||
        mobile.trim().isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        dateOfBirth.trim().isEmpty ||
        gender.trim().isEmpty ||
        country.isEmpty ||
        state.isEmpty ||
        pincode.trim().isEmpty ||
        addressLine1.trim().isEmpty ||
        addressLine2.trim().isEmpty ||
        qualification.isEmpty ||
        collegeName.trim().isEmpty) {
      throw Exception('Please fill all required fields.');
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email.trim())) {
      throw Exception('Please enter a valid email address.');
    }

    if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile.trim())) {
      throw Exception('Mobile number must contain 10 digits.');
    }

    if (password.length < 6) {
      throw Exception('Password must contain at least 6 characters.');
    }

    if (password != confirmPassword) {
      throw Exception('Passwords do not match.');
    }

    if (!isAgreed) {
      throw Exception('Please agree to the terms and conditions.');
    }

    await _firestoreService.saveUserData({
      'fullName': fullName.trim(),
      'username': username.trim(),
      'email': email.trim(),
      'mobile': mobile.trim(),
      'dateOfBirth': dateOfBirth.trim(),
      'gender': gender.trim(),
      'country': country,
      'state': state,
      'city': city,
      'pincode': pincode.trim(),
      'addressLine1': addressLine1.trim(),
      'addressLine2': addressLine2.trim(),
      'qualification': qualification,
      'collegeName': collegeName.trim(),
      'isAgreed': isAgreed,
    });
  }
}
