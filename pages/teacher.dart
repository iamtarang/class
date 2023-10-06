import 'package:classfindr/pages/Karate.dart';
import 'package:classfindr/pages/coaching.dart';
import 'package:classfindr/pages/dance.dart';
import 'package:classfindr/pages/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/routes.dart';
class TeacherPage extends StatefulWidget{
  @override
  _TeacherPageState createState() => _TeacherPageState();
}
enum Gender { male, female }
enum private {yes , no}
String selectedclass = "None ";



class _TeacherPageState extends State<TeacherPage> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();


  String selectedAverageResult = "Below 60%";

  final pincodePattern = r'^\d{6}$';
  TextEditingController nameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Gender? selectedGender = Gender.male;
  DateTime? selectedDate;
  int numberOfBranches = 0;
  final TextEditingController homeAddressController = TextEditingController();
  final TextEditingController classAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController city1Controller = TextEditingController();
  final TextEditingController pincode1Controller = TextEditingController();
  final TextEditingController class2AddressController = TextEditingController();
  final TextEditingController city2Controller = TextEditingController();
  final TextEditingController pincode2Controller = TextEditingController();
  TextEditingController morningStartController = TextEditingController();
  TextEditingController morningEndController = TextEditingController();
  TextEditingController afternoonStartController = TextEditingController();
  TextEditingController afternoonEndController = TextEditingController();
  TextEditingController eveningStartController = TextEditingController();
  TextEditingController eveningEndController = TextEditingController();
  TextEditingController nightStartController = TextEditingController();
  TextEditingController nightEndController = TextEditingController();
  bool autoFillOffice = false;
  private? selectedprivate = private.yes;

  void initState() {
    super.initState();
    homeAddressController.addListener(() {
      if (autoFillOffice) {
        classAddressController.text = homeAddressController.text;
        cityController.text = city1Controller.text;
        pincodeController.text = pincode1Controller.text;
      }
    });
  }

  @override
  void dispose() {
    homeAddressController.dispose();
    classAddressController.dispose();
    city1Controller.dispose();
    cityController.dispose();
    pincodeController.dispose();
    pincode1Controller.dispose();
    super.dispose();
  }

  TimeOfDay? morningStartTime;
  TimeOfDay? morningEndTime;
  TimeOfDay? eveningStartTime;
  TimeOfDay? eveningEndTime;
  TimeOfDay? nightStartTime;
  TimeOfDay? nightEndTime;
  TimeOfDay? afternoonStartTime;
  TimeOfDay? afternoonEndTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, Widget ? child) {
        return Theme(data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(primary: Color(0xFFb185db),
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

  Future<void> _selectTime(BuildContext context,
      TextEditingController startController,
      TextEditingController endController) async {
    final Color clockColor = Color(0xFF6F35A5);

    final TimeOfDay? startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: clockColor, // Set the clock color
            colorScheme: ColorScheme.light(primary: clockColor),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            // Display AM/PM
            child: child!,
          ),
        );
      },
    );

    if (startTime != null) {
      final TimeOfDay? endTime = await showTimePicker(
        context: context,
        initialTime: startTime,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: clockColor,
              colorScheme: ColorScheme.light(primary: clockColor),
            ),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  alwaysUse24HourFormat: false),
              child: child!,
            ),
          );
        },
      );
      if (endTime != null) {
        setState(() {
          startController.text = startTime.format(context);
          endController.text = endTime.format(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      double fontSize = MediaQuery
          .of(context)
          .size
          .width * 0.04; // Adjust the multiplier as needed
      return Scaffold(
          appBar: new AppBar(
            backgroundColor: Color(0xFF7b2cbf),
            title: new Text("Teacher", style: GoogleFonts.baskervville(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
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
                                vertical: 1.h,
                                horizontal: 0.h,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(
                                  Icons.person, color: Color(0xFF6F35A5),
                                  size: 30),
                              title: Container(
                                child: TextFormField(
                                  controller: nameController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-zA-Z]')),
                                    // Allow only alphabetic characters
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
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.5.h,
                                horizontal: 0.h,
                              ),
                            ),

                            ListTile(
                              leading: const Icon(
                                  Icons.person, color: Color(0xFF6F35A5),
                                  size: 35),

                              title: Container(
                                child: TextFormField(
                                  controller: lnameController,
                                  keyboardType: TextInputType.name,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-zA-Z]')),
                                    // Allow only alphabetic characters
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
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text('  Gender :', style: GoogleFonts
                                    .baskervville(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6F35A5)
                                ),),
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
                                Text('Male',
                                  style: GoogleFonts.baskervville(
                                      color: Color(0xFF6F35A5),
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.w600),
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
                                Text('Female',
                                  style: GoogleFonts.baskervville(
                                      color: Color(0xFF6F35A5),
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            ListTile(
                              leading: const Icon(
                                  Icons.cake, color: Color(0xFF6F35A5),
                                  size: 40),
                              title: TextFormField(
                                onTap: () => _selectDate(context),
                                readOnly: true,
                                controller: TextEditingController(
                                  text: selectedDate != null
                                      ? "${selectedDate!.day}/${selectedDate!
                                      .month}/${selectedDate!.year}"
                                      : "",
                                ),
                                validator: (value) {
                                  if (selectedDate == null) {
                                    return 'Date of Birth is required.';
                                  }
                                  return null; // Return null to indicate the input is valid
                                },
                                decoration: InputDecoration(
                                  hintText: "Date of Birth",
                                  hintStyle: GoogleFonts.baskervville(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: fontSize
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
                                vertical: 0.5.h,
                                horizontal: 0.h,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(
                                  Icons.phone, color: Color(0xFF6F35A5),
                                  size: 40),
                              title: Container(
                                child: TextFormField(
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  // Set the keyboard type to number
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    // Allow only digits
                                  ],
                                  controller: phoneController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Mobile number is required';
                                    }
                                    if (value.length != 10) {
                                      return 'Phone number must be exactly \n 10 digits';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Phone",
                                    hintStyle: GoogleFonts.baskervville(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSize
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            ListTile(
                              leading: const Icon(
                                  Icons.class_rounded, color: Color(0xFF6F35A5),
                                  size: 40),
                              title: Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  maxLines: 3,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'ClassName is required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Class Name",
                                    hintStyle: GoogleFonts.baskervville(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSize
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.5.h,
                                horizontal: 0.h,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(
                                  Icons.home, color: Color(0xFF6F35A5),
                                  size: 40),
                              title: Container(
                                child: TextFormField(
                                  controller: homeAddressController,
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
                                      fontSize: fontSize
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.5.h,
                                horizontal: 0.h,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(
                                  Icons.location_on, color: Color(0xFF6F35A5),
                                  size: 40),
                              title: Container(
                                child: TextFormField(
                                  controller: cityController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'City is required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "City",
                                    hintStyle: GoogleFonts.baskervville(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSize
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.5.h,
                                horizontal: 0.h,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.location_on_outlined,
                                  color: Color(0xFF6F35A5), size: 40),
                              title: Container(
                                child: TextFormField(
                                  controller: pincodeController,
                                  keyboardType: TextInputType.number,
                                  // Set the keyboard type to number
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    // Allow only digits
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Pincode is required';
                                    }
                                    if (!RegExp(pincodePattern).hasMatch(
                                        value)) {
                                      return 'Invalid PIN code format. Please enter a 6-digit PIN code.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Pincode",
                                    hintStyle: GoogleFonts.baskervville(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSize
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 0.h,
                                      horizontal: 1.h,
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor: Color(
                                          0xFF6F35A5), // Change the color here
                                    ),
                                    child: Checkbox(
                                      activeColor: Color(0xFF6F35A5),
                                      value: autoFillOffice,
                                      onChanged: (newValue) {
                                        setState(() {
                                          autoFillOffice = newValue!;
                                          if (autoFillOffice) {
                                            classAddressController.text =
                                                homeAddressController.text;
                                            city1Controller.text =
                                                cityController.text;
                                            pincode1Controller.text =
                                                pincodeController.text;
                                          } else {
                                            classAddressController.clear();
                                            city1Controller.clear();
                                            pincode1Controller.clear();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  Text('Same as above', style: GoogleFonts
                                      .baskervville(
                                    color: Color(0xFF6F35A5),
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  ),
                                ]
                            ),
                            ListTile(
                              leading: const Icon(
                                  Icons.home, color: Color(0xFF6F35A5),
                                  size: 40),
                              title: Container(
                                child: TextFormField(
                                  controller: classAddressController,
                                  maxLines: 3,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Address is required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Class Address",
                                    hintStyle: GoogleFonts.baskervville(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSize
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.5.h,
                                horizontal: 0.h,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(
                                  Icons.location_on, color: Color(0xFF6F35A5),
                                  size: 40),
                              title: Container(
                                child: TextFormField(
                                  controller: city1Controller,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'City is required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "City",
                                    hintStyle: GoogleFonts.baskervville(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSize
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.5.h,
                                horizontal: 0.h,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.location_on_outlined,
                                  color: Color(0xFF6F35A5), size: 40),
                              title: Container(
                                child: TextFormField(
                                  controller: pincode1Controller,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Pincode is required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Pincode",
                                    hintStyle: GoogleFonts.baskervville(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSize
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.5.h,
                                horizontal: 0.h,
                              ),
                            ),

                            ListTile(
                                leading: const Icon(
                                    Icons.home_work, color: Color(0xFF6F35A5),
                                    size: 40),
                                title: Container(
                                  child: Column(
                                      children: [
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Required';
                                            }
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Number of branches',
                                            labelStyle: GoogleFonts
                                                .baskervville(
                                                color: Color(0xFF6F35A5)),
                                            hintText: "1,2....",
                                            hintStyle: GoogleFonts.baskervville(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: fontSize
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              numberOfBranches =
                                                  int.tryParse(value) ?? 0;
                                            }
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 0.5.h,
                                            horizontal: 0.h,
                                          ),
                                        ),
                                        Container(
                                          height: numberOfBranches * 100,
                                          // Adjust the height as needed
                                          child: SingleChildScrollView(
                                            child: Column(
                                                children: List.generate(
                                                    numberOfBranches, (index) {
                                                  return Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        vertical: 0.h),
                                                    child: Column(
                                                        children: [
                                                          TextFormField(
                                                            controller: class2AddressController,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return 'Address is required';
                                                              }
                                                            },
                                                            decoration: InputDecoration(
                                                              labelText: 'Address for Branch${index +
                                                                  1}',
                                                              labelStyle: GoogleFonts
                                                                  .baskervville(),
                                                            ),
                                                            maxLines: 2,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 1.h,
                                                              horizontal: 0.h,
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: city2Controller,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return 'City is required';
                                                              }
                                                            },
                                                            decoration: InputDecoration(
                                                              labelText: 'City for Branch ${index +
                                                                  1}',
                                                              labelStyle: GoogleFonts
                                                                  .baskervville(),
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 0.5.h,
                                                              horizontal: 0.h,
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: pincode2Controller,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return 'Pincode is required';
                                                              }
                                                            },
                                                            decoration: InputDecoration(
                                                              labelText: 'Pincode for Branch ${index +
                                                                  1}',
                                                              labelStyle: GoogleFonts
                                                                  .baskervville(),
                                                            ),
                                                            // controller: _textEditingController,
                                                            maxLines: 1,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 0.5.h,
                                                              horizontal: 0.h,
                                                            ),
                                                          ),
                                                        ]),
                                                  );
                                                })
                                            ),
                                          ),
                                        )
                                      ]),

                                )
                            ),
                            Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 0.h,
                                      horizontal: 1.h,
                                    ),
                                  ),
                                  Icon(Icons.access_time_filled_outlined,
                                      color: Color(0xFF6F35A5), size: 30),
                                  Text('    Timings :--',
                                    style: GoogleFonts.baskervville(
                                        color: Color(0xFF6F35A5),
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ]
                            ),
                            SizedBox(height: 0),
                            CheckboxListTile(
                              activeColor: Color(0xFF6F35A5),

                              title: Text(
                                "Morning", style: GoogleFonts.baskervville(
                                color: Color(0xFF6F35A5),
                                fontSize: fontSize,
                                fontWeight: FontWeight.w600,
                              ),
                              ),

                              value: morningStartTime != null &&
                                  morningEndTime != null,
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    morningStartTime = TimeOfDay.now();
                                    morningEndTime = TimeOfDay.now();
                                    morningStartController.text =
                                        morningStartTime!.format(context);
                                    morningEndController.text =
                                        morningEndTime!.format(context);
                                  } else {
                                    morningStartTime = null;
                                    morningEndTime = null;
                                    morningStartController.text = '';
                                    morningEndController.text = '';
                                  }
                                });
                              },
                            ),
                            SizedBox(height: 0),
                            CheckboxListTile(
                              activeColor: Color(0xFF6F35A5),
                              title: Text(
                                "Afternoon", style: GoogleFonts.baskervville(
                                color: Color(0xFF6F35A5),
                                fontSize: fontSize,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                              value: afternoonStartTime != null &&
                                  afternoonEndTime != null,
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    afternoonStartTime = TimeOfDay.now();
                                    afternoonEndTime = TimeOfDay.now();
                                    afternoonStartController.text =
                                        afternoonStartTime!.format(context);
                                    afternoonEndController.text =
                                        afternoonEndTime!.format(context);
                                  } else {
                                    afternoonStartTime = null;
                                    afternoonEndTime = null;
                                    afternoonStartController.text = '';
                                    afternoonEndController.text = '';
                                  }
                                });
                              },
                            ),
                            CheckboxListTile(
                              activeColor: Color(0xFF6F35A5),
                              title: Text(
                                "Evening", style: GoogleFonts.baskervville(
                                color: Color(0xFF6F35A5),
                                fontSize: fontSize,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                              value: eveningStartTime != null &&
                                  eveningEndTime != null,
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    eveningStartTime = TimeOfDay.now();
                                    eveningEndTime = TimeOfDay.now();
                                    eveningStartController.text =
                                        eveningStartTime!.format(context);
                                    eveningEndController.text =
                                        eveningEndTime!.format(context);
                                  } else {
                                    eveningStartTime = null;
                                    eveningEndTime = null;
                                    eveningStartController.text = '';
                                    eveningEndController.text = '';
                                  }
                                });
                              },
                            ),
                            CheckboxListTile(
                              activeColor: Color(0xFF6F35A5),
                              title: Text(
                                "Night", style: GoogleFonts.baskervville(
                                color: Color(0xFF6F35A5),
                                fontSize: fontSize,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                              value: nightStartTime != null &&
                                  nightEndTime != null,
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    nightStartTime = TimeOfDay.now();
                                    nightEndTime = TimeOfDay.now();
                                    nightStartController.text =
                                        nightStartTime!.format(context);
                                    nightEndController.text =
                                        nightEndTime!.format(context);
                                  } else {
                                    nightStartTime = null;
                                    nightEndTime = null;
                                    nightStartController.text = '';
                                    nightEndController.text = '';
                                  }
                                });
                              },
                            ),
                            if (morningStartTime != null &&
                                morningEndTime != null)
                              ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      "Morning:",
                                      style: TextStyle(
                                        color: Color(0xFF6F35A5),
                                        fontWeight: FontWeight.w600,
                                        fontSize: fontSize,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 110, // Adjust the width as needed
                                      child: TextField(
                                        onTap: () =>
                                            _selectTime(
                                                context, morningStartController,
                                                morningEndController),
                                        controller: morningStartController,
                                        decoration: InputDecoration(
                                          hintText: "Start",
                                          hintStyle: GoogleFonts.baskervville(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: fontSize,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                _selectTime(context,
                                                    morningStartController,
                                                    morningEndController),
                                            icon: Icon(Icons.access_time),
                                            color: Color(0xFF6F35A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 110, // Adjust the width as needed
                                      child: TextField(
                                        onTap: () =>
                                            _selectTime(
                                                context, morningStartController,
                                                morningEndController),
                                        controller: morningEndController,
                                        decoration: InputDecoration(
                                          hintText: "End",
                                          hintStyle: GoogleFonts.baskervville(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: fontSize,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                _selectTime(context,
                                                    morningStartController,
                                                    morningEndController),
                                            icon: Icon(Icons.access_time),
                                            color: Color(0xFF6F35A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (afternoonStartTime != null &&
                                afternoonEndTime != null)
                              ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      "Afternoon:",
                                      style: TextStyle(
                                        color: Color(0xFF6F35A5),
                                        fontWeight: FontWeight.w600,
                                        fontSize: fontSize,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      child: TextField(
                                        onTap: () =>
                                            _selectTime(context,
                                                afternoonStartController,
                                                afternoonEndController),
                                        controller: afternoonStartController,
                                        decoration: InputDecoration(
                                          hintText: "Start",
                                          hintStyle: GoogleFonts.baskervville(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: fontSize,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                _selectTime(context,
                                                    afternoonStartController,
                                                    afternoonEndController),
                                            icon: Icon(Icons.access_time),
                                            color: Color(0xFF6F35A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 110, // Adjust the width as needed
                                      child: TextField(
                                        onTap: () =>
                                            _selectTime(context,
                                                afternoonStartController,
                                                afternoonEndController),
                                        controller: afternoonEndController,
                                        decoration: InputDecoration(
                                          hintText: "End",
                                          hintStyle: GoogleFonts.baskervville(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: fontSize,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                _selectTime(context,
                                                    afternoonStartController,
                                                    afternoonEndController),
                                            icon: Icon(Icons.access_time),
                                            color: Color(0xFF6F35A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (eveningStartTime != null &&
                                eveningEndTime != null)
                              ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      "Evening:",
                                      style: TextStyle(
                                        color: Color(0xFF6F35A5),
                                        fontWeight: FontWeight.w600,
                                        fontSize: fontSize,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 110, // Adjust the width as needed
                                      child: TextField(
                                        onTap: () =>
                                            _selectTime(
                                                context, eveningStartController,
                                                eveningEndController),
                                        controller: eveningStartController,
                                        decoration: InputDecoration(
                                          hintText: "Start",
                                          hintStyle: GoogleFonts.baskervville(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: fontSize,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                _selectTime(context,
                                                    eveningStartController,
                                                    eveningEndController),
                                            icon: Icon(Icons.access_time),
                                            color: Color(0xFF6F35A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 110, // Adjust the width as needed
                                      child: TextField(
                                        onTap: () =>
                                            _selectTime(
                                                context, eveningStartController,
                                                eveningEndController),
                                        controller: eveningEndController,
                                        decoration: InputDecoration(
                                          hintText: "End",
                                          hintStyle: GoogleFonts.baskervville(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: fontSize,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                _selectTime(context,
                                                    eveningStartController,
                                                    eveningEndController),
                                            icon: Icon(Icons.access_time),
                                            color: Color(0xFF6F35A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (nightStartTime != null && nightEndTime != null)
                              ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      "Night:",
                                      style: TextStyle(
                                        color: Color(0xFF6F35A5),
                                        fontWeight: FontWeight.w600,
                                        fontSize: fontSize,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // Add spacing between "Morning:" and "Start"
                                    Container(
                                      width: 110, // Adjust the width as needed
                                      child: TextField(
                                        onTap: () =>
                                            _selectTime(
                                                context, nightStartController,
                                                nightEndController),
                                        controller: nightStartController,
                                        decoration: InputDecoration(
                                          hintText: "Start",
                                          hintStyle: GoogleFonts.baskervville(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: fontSize,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                _selectTime(context,
                                                    nightStartController,
                                                    nightEndController),
                                            icon: Icon(Icons.access_time),
                                            color: Color(0xFF6F35A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // Add spacing between "Start" and "End"
                                    Container(
                                      width: 110, // Adjust the width as needed
                                      child: TextField(
                                        onTap: () =>
                                            _selectTime(
                                                context, nightStartController,
                                                nightEndController),
                                        controller: nightEndController,
                                        decoration: InputDecoration(
                                          hintText: "End",
                                          hintStyle: GoogleFonts.baskervville(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: fontSize,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                _selectTime(context,
                                                    nightStartController,
                                                    nightEndController),
                                            icon: Icon(Icons.access_time),
                                            color: Color(0xFF6F35A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 1.h,
                                horizontal: 0.h,
                              ),
                            ),
                            Row(
                                children: <Widget>[
                                  Text('   Do you take private classes ? ',
                                    style: GoogleFonts.baskervville(
                                      color: Color(0xFF6F35A5),
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.h,
                                    horizontal: 4.h,
                                  ),
                                ),
                                Radio<private>(
                                  activeColor: Color(0xFF6F35A5),
                                  value: private.yes,
                                  groupValue: selectedprivate,
                                  onChanged: (private? value) {
                                    setState(() {
                                      selectedprivate = value;
                                    });
                                  },
                                ),
                                Text(
                                  'YES',
                                  style: GoogleFonts.baskervville(
                                    color: Color(0xFF6F35A5),
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.h,
                                    horizontal: 5.h,
                                  ),
                                ),
                                Radio<private>(
                                  activeColor: Color(0xFF6F35A5),
                                  value: private.no,
                                  groupValue: selectedprivate,
                                  onChanged: (private? value) {
                                    setState(() {
                                      selectedprivate = value;
                                    });
                                  },
                                ),
                                Text(
                                  'NO',
                                  style: GoogleFonts.baskervville(
                                    color: Color(0xFF6F35A5),
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                                children: <Widget>[
                                  Text('   No. of years of experience  :    ',
                                    style: GoogleFonts.baskervville(
                                        color: Color(0xFF6F35A5),
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]
                            ),
                            ListTile(
                              title: Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "1 , 2 .....",
                                    hintStyle: GoogleFonts.baskervville(
                                      color: Colors.grey,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                                children: <Widget>[
                                  Text(' Types of classes:    ',
                                    style: GoogleFonts.baskervville(
                                        color: Color(0xFF6F35A5),
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  DropdownButton<String>(
                                    value: selectedclass,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedclass = newValue!;
                                      }
                                      );
                                    },
                                    items: <String>[
                                      'None ',
                                      'Coaching ',
                                      'Dance ',
                                      'Karate ',
                                      'Painting ',
                                    ].map<DropdownMenuItem<String>>((
                                        String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                            style: GoogleFonts.baskervville(
                                                fontWeight: FontWeight.w500,
                                                fontSize: fontSize,
                                                color: Color(0xFF6F35A5))),
                                      );
                                    }).toList(),
                                  ),
                                ]
                            ),
                            Visibility(
                              visible: selectedclass == 'Dance ',
                              child: DanceWidget(),
                            ),
                            Visibility(
                              visible: selectedclass == 'Coaching ',
                              child: CoachingForm(), // Display the fields when 'Coaching' is selected
                            ),
                            Visibility(
                              visible: selectedclass == 'Karate ',
                              child: karate(), // Display the fields when 'Coaching' is selected
                            ),
                            Visibility(
                              visible: selectedclass == 'Painting ',
                              child: Painting(), // Display the fields when 'Coaching' is selected
                            ),
                            Padding(padding: EdgeInsets.symmetric(
                              vertical: 0.5.h,
                              horizontal: 0.h,
                            ),
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context, MyRoutes.otpgeneratorRoute2);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(130, 50),
                                  backgroundColor: Color(0xFF6F35A5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Next',
                                  style: GoogleFonts.baskervville(
                                    color: Colors.white,
                                    fontSize: fontSize,
                                    // Adjust your fontSize as needed
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.symmetric(
                              vertical: 0.5.h,
                              horizontal: 0.h,
                            ),
                            ),

                          ]
                      )
                  )
              )
          )
      );
    }
    );
  }
}


