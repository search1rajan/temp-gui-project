import 'package:flutter/material.dart';

import '../controllers/registration_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool _isAgreed = false;
  bool _isSaving = false;

  final RegistrationController _registrationController =
      RegistrationController();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();

  String? _selectedCountry;
  String? _selectedState;
  String? _selectedCity;
  String? _selectedQualification;

  Future<void> _registerUser() async {
    if (_isSaving) return;

    setState(() {
      _isSaving = true;
    });

    try {
      await _registrationController.register(
        fullName: _fullNameController.text,
        username: _usernameController.text,
        email: _emailController.text,
        mobile: _mobileController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        dateOfBirth: _dobController.text,
        gender: _genderController.text,
        country: _selectedCountry ?? '',
        state: _selectedState ?? '',
        city: _selectedCity ?? '',
        pincode: _pincodeController.text,
        addressLine1: _address1Controller.text,
        addressLine2: _address2Controller.text,
        qualification: _selectedQualification ?? '',
        collegeName: _collegeController.text,
        isAgreed: _isAgreed,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration data saved successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      _fullNameController.clear();
      _usernameController.clear();
      _emailController.clear();
      _mobileController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      _dobController.clear();
      _genderController.clear();
      _pincodeController.clear();
      _address1Controller.clear();
      _address2Controller.clear();
      _collegeController.clear();

      setState(() {
        _selectedCountry = null;
        _selectedState = null;
        _selectedCity = null;
        _selectedQualification = null;
        _isAgreed = false;
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _pincodeController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _collegeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'User Registration Form',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "times new roman",
                ),
              ),
              Text(
                'Please fill all the details carefully',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: "times new roman",
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_add_alt_1_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1. Full Name *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _fullNameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your full name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2. Username *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: 'Choose a username',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3. Email address *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter your email ',
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4. Mobile Number *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _mobileController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Enter 10 digit number',
                              prefixIcon: Icon(
                                Icons.call,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '5. Password *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '6. Confirm Password *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Re - enter password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '7. Date of Birth *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _dobController,
                            decoration: InputDecoration(
                              hintText: 'DD/MM/YYYY',
                              prefixIcon: Icon(
                                Icons.date_range_outlined,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '8. Gender *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _genderController,
                            decoration: InputDecoration(
                              hintText: 'Enter your gender',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '9. Country *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedCountry,
                            hint: Text('Select Contory'),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.wordpress_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            items:
                                [
                                  'India',
                                  'Rassian',
                                  'America',
                                  'pakistan',
                                  'bhutan',
                                  'nepal',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedCountry = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '10. State *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedState,
                            hint: Text('Select State'),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.start_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            items:
                                [
                                  'Uttra Pradesh',
                                  'Bihar',
                                  'Jharkhand',
                                  'Gujrat',
                                  'Panjab',
                                  'Other',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedState = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '11. City',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedCity,
                            hint: Text('Select City'),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_city_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            items:
                                [
                                  'Sultanpur',
                                  'Gazipur',
                                  'Lukhnow',
                                  'jaunpur',
                                  'Talbehat',
                                  'other',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedCity = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12. Enter Pincode *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _pincodeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'enter your pincode',
                              prefixIcon: Icon(
                                Icons.numbers_outlined,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '13. Address Line 1 *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _address1Controller,
                            decoration: InputDecoration(
                              hintText: 'Enter your full current address',
                              prefixIcon: Icon(
                                Icons.local_activity_outlined,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '14. Address Line 2 *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _address2Controller,
                            decoration: InputDecoration(
                              hintText: 'Enter pramanent address',
                              prefixIcon: Icon(
                                Icons.local_activity_outlined,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '15. Qualification *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            initialValue: _selectedQualification,
                            hint: Text('Select qualification'),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.cast_for_education_outlined,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            items:
                                [
                                  'B.A/B.S.C.',
                                  'B.Tech',
                                  'B. Com',
                                  'M.Tech',
                                  'other',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedQualification = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '16. Collage/ Institute Name *',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _collegeController,
                            decoration: InputDecoration(
                              hintText: 'Enter Collage/ Institute Name ',
                              prefixIcon: Icon(
                                Icons.school_outlined,
                                color: Colors.lightBlue,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(width: 20),
                              Text('25. Agree to terms & Conditions *'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: _isAgreed,
                                activeColor: Colors.blue,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isAgreed = value ?? false;
                                  });
                                },
                              ),
                              Text('I agree to the  terms and conditions.'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _isSaving ? null : _registerUser,
                        child: _isSaving
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text('Register Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
