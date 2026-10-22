class UserModel {
  final String uid;
  final String fullName;
  final String username;
  final String email;
  final String mobile;
  final String dateOfBirth;
  final String gender;
  final String country;
  final String state;
  final String city;
  final String pincode;
  final String addressLine1;
  final String addressLine2;
  final String qualification;
  final String collegeName;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.username,
    required this.email,
    required this.mobile,
    required this.dateOfBirth,
    required this.gender,
    required this.country,
    required this.state,
    required this.city,
    required this.pincode,
    required this.addressLine1,
    required this.addressLine2,
    required this.qualification,
    required this.collegeName,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'username': username,
      'email': email,
      'mobile': mobile,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'country': country,
      'state': state,
      'city': city,
      'pincode': pincode,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'qualification': qualification,
      'collegeName': collegeName,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
