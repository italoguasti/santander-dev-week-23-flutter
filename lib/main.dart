import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandanter_dev_week_23_flutter/pages/home/home_page.dart';
import 'package:sandanter_dev_week_23_flutter/shared/app_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettings.screenHeigth = MediaQuery.of(context).size.height;
    AppSettings.screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Santander App',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
      ),
      home: const HomePage(),
    );
  }
}
