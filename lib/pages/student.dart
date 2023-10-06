import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/routes.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

enum Gender { male, female }

final pincodePattern = r'^\d{6}$';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController nameController = TextEditingController();
TextEditingController lnameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
bool isEmailValid(String email) {
  // Define a regular expression pattern for email validation
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  // Use the RegExp's 'hasMatch' method to check if the email is valid
  return emailRegex.hasMatch(email);
}

class _StudentPageState extends State<StudentPage> {
  TextEditingController _textEditingController = TextEditingController();
  Gender? selectedGender = Gender.male;
  DateTime? selectedDate;
  String? selectedCity;
  String? selectedCountry;
  String? cscPickerError;
  String? enteredPincode;
  String? emailError;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFb185db),
            ),
          ),
          child: child ?? Container(),
        );
      },
    ))!;
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _checkEmailUniqueness(BuildContext context) async {
    // Create a reference to your Firestore collection
    CollectionReference students =
        FirebaseFirestore.instance.collection('students');

    // Check if the email already exists in Firestore
    QuerySnapshot emailCheck =
        await students.where('email', isEqualTo: emailController.text).get();

    if (emailCheck.docs.isNotEmpty) {
      // Email already exists, set the error message
      setState(() {
        emailError = 'Email already exists. Please use a different email.';
      });
    } else {
      await students.add({
        'first_name': nameController.text,
        'last_name': lnameController.text,
        'gender': selectedGender.toString(),
        'date_of_birth': selectedDate.toString(),
        'email': emailController.text,
        'phone': phoneController.text,
        'address': _textEditingController.text,
        'city': selectedCity ?? '', // Use selected city
        'pincode': enteredPincode ?? '', // Use entered pincode
      });

      // Email is unique, proceed to the next step
      _navigateToNextScreen();
    }
  }

  void _navigateToNextScreen() {
    // Navigate to the next screen or perform other actions
    Navigator.pushNamed(context, MyRoutes.otpgeneratorRoute2);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Student",
            style: GoogleFonts.baskervville(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person,
                        color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                      child: TextFormField(
                        controller: nameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              r'[a-zA-Z]')), // Allow only alphabetic characters
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Firstname is required';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "First Name",
                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person,
                        color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                      child: TextFormField(
                        controller: lnameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              r'[a-zA-Z]')), // Allow only alphabetic characters
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lastname is required';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '      Gender :',
                        style: GoogleFonts.baskervville(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6F35A5),
                          ),
                        ),
                      ),
                      Radio<Gender>(
                        activeColor: Color(0xFF6F35A5),
                        value: Gender.male,
                        groupValue: selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      Text(
                        'Male',
                        style: GoogleFonts.baskervville(
                          color: Color(0xFF6F35A5),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Radio<Gender>(
                        activeColor: Color(0xFF6F35A5),
                        value: Gender.female,
                        groupValue: selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      Text(
                        'Female',
                        style: GoogleFonts.baskervville(
                          color: Color(0xFF6F35A5),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.cake,
                        color: Color(0xFF6F35A5), size: 40),
                    title: TextFormField(
                      onTap: () => _selectDate(context),
                      readOnly: true,
                      controller: TextEditingController(
                        text: selectedDate != null
                            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                            : "",
                      ),
                      validator: (value) {
                        if (selectedDate == null) {
                          return 'Date of Birth is required.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Date of Birth",
                        hintStyle: GoogleFonts.baskervville(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => _selectDate(context),
                          icon: Icon(Icons.calendar_month),
                          color: Color(0xFF6F35A5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone,
                        color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                      child: TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Mobile number is required';
                          }
                          if (value.length != 10) {
                            return 'Phone number must be exactly 10 digits';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Phone",
                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email,
                        color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                      child: TextFormField(
                        keyboardType: TextInputType
                            .emailAddress, // Set the keyboard type to email address
                        controller:
                            emailController, // Use the appropriate controller for email
                        decoration: InputDecoration(
                          hintText: "E-mail",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          errorText: emailError,
                          // Set the error text style to red color
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          } else if (!isEmailValid(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null; // Return null if the input is valid
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home,
                        color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                      child: TextFormField(
                        controller: _textEditingController,
                        maxLines: 3,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is required';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on,
                        color: Color(0xFF6F35A5), size: 40),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CSCPicker(
                          dropdownDecoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF1E6FF),
                              border: Border.all(
                                  color: Color(0xFFF1E6FF), width: 1)),
                          onCountryChanged: (value) {
                            setState(() {
                              selectedCountry =
                                  value; // Update the selected country
                            });
                          },
                          onStateChanged: (value) {
                            // Handle state selection here
                          },
                          onCityChanged: (value) {
                            setState(() {
                              selectedCity = value; // Update the selected city
                            });
                            setState(() {
                              cscPickerError = null;
                            });
                          },
                          defaultCountry: CscCountry.India,
                          showStates: true,
                          showCities: true,
                        ),
                        if (cscPickerError != null)
                          Text(
                            cscPickerError!,
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.5.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined,
                        color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          setState(() {
                            enteredPincode =
                                value; // Update the entered pincode
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Pincode is required';
                          }
                          if (!RegExp(pincodePattern).hasMatch(value)) {
                            return 'Invalid PIN code format. Please enter a 6-digit PIN code.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Pincode",
                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 10.h,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (selectedCity == null) {
                            // City not selected, set the validation error message
                            setState(() {
                              cscPickerError = 'Please select a city';
                            });
                            return; // Exit the function without proceeding
                          }
                          // Create a reference to your Firestore collection
                          CollectionReference students =
                              FirebaseFirestore.instance.collection('students');
                          await _checkEmailUniqueness(context);

                          // Add data to Firestore with city and pincode

                          // Navigate to the next screen or perform other actions
                        }
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size(60, 40),
                          backgroundColor: Color(0xFF6F35A5)),
                      child: Text(
                        "  Next   ",
                        style: GoogleFonts.notoSerif(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 10.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
