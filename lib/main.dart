import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shaty/screens/auth/change_password_screen.dart';
import 'package:shaty/screens/auth/login_screen.dart';
import 'package:shaty/screens/auth/rest_password_screen.dart';
import 'package:shaty/screens/auth/sign_in_patient_screen.dart';
import 'package:shaty/screens/auth/verification_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaty/screens/doctor/screen/bottom_navigation_screen.dart';
import 'package:shaty/screens/doctor/screen/doctor_home_screen.dart';
import 'package:shaty/screens/patient/widget/patient_bottom_nav_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: '/login_screen',
      routes: {
        '/login_screen': (context)=> const LoginScreen(),
        '/sign_in_screen': (context)=> const SignInPatient(),
        '/rest_password_screen': (context)=> const RestPasswordScreen(),
        '/verification_screen': (context)=> const VerificationScreen(),
        '/change_password_screen': (context)=> const ChangePasswordScreen(),
        '/doctor_home_screen': (context)=> const DoctorHomeScreen(),
        '/bottom_navigation_screen': (context)=> const BottomNavigationScreen(),
        '/patient_bottom_nav_bar': (context)=> const PatientBottomNavBar(),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales:const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: const Locale('ar'),
    );

  }
}

