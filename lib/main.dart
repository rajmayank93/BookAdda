import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Pages/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

// MAIN PAGE
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // DESIGNED A MATERIAL APP DIRECTING TO HOMEPAGE
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) =>
      Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            //GOOGLE FONTS IMPORT
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          title: 'BookAdda',
          home: const HomePage(),
        );
      });
}
