import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:classfindr/firebase_options.dart';
import 'package:classfindr/pages/Karate.dart';
import 'package:classfindr/pages/coaching.dart';
import 'package:classfindr/pages/dance.dart';
import 'package:classfindr/pages/membership.dart';
import 'package:classfindr/pages/otpgenerator.dart';
import 'package:classfindr/pages/otpgenerator2.dart';
import 'package:classfindr/pages/painting.dart';
import 'package:classfindr/pages/register.dart';
import 'package:classfindr/pages/student.dart';
import 'package:classfindr/pages/teacher.dart';
import 'package:classfindr/pages/username.dart';
import 'package:classfindr/pages/usernamet.dart';
import 'package:classfindr/pages/welcome.dart';
import 'package:classfindr/utils/forgotpwdmail.dart';
import 'package:classfindr/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'constants.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'package:page_transition/page_transition.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key)
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Kaksha Findr',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: kPrimaryColor,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColor,
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            )),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        home: AnimatedSplashScreen(
          splash: Image.asset('assets/splash.jpg'),
          splashIconSize: 300,
          nextScreen: welcome(),
          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Color(0xFFDBCAE2),
          duration: 2000,
        ),
        routes: {
          MyRoutes.homeRoute: (context) => Homepage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.registerRoute: (context) => RegisterPage(),
          MyRoutes.teacherRoute: (context) => TeacherPage(),
          MyRoutes.studentRoute: (context) => StudentPage(),
          MyRoutes.danceRoute : (context) => DanceWidget(),
          MyRoutes.coachingRoute:(context) => CoachingForm(),
          MyRoutes.karateRoute : (context) => karate(),
          MyRoutes.paintingRoute : (context) => Painting(),
          MyRoutes.membershipRoute : (context) => membership(),
          MyRoutes.otpgeneratorRoute2 : (context) => Home(),
          MyRoutes.usernameRoute : (context) => username(),
          MyRoutes.mailRoute : (context) => forgotmail(),
          MyRoutes.usernametRoute : (context) => usernamet(),
          MyRoutes.otpgeneratorRoute : (context) => Home1(),

        },
      );
    });
  }
}

/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IconButton Example'),
        ),
        body: Center(
          child: MyIconButton(),
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Add your button action here
      },
      icon: Icon(
        Icons.star, // Replace with your desired icon
        size: 36.0, // Adjust icon size as needed
        color: Colors.yellow, // Icon color
      ),
    );
  }
}*/
