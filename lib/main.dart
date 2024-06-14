import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Provider/menu_provider.dart';
import 'View/menu_item_screen_card.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MenuProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App2Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          titleMedium: GoogleFonts.montserrat(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          titleLarge: GoogleFonts.montserrat(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          //Body Small
          bodyMedium: GoogleFonts.montserrat(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),

          //Body Medium
          bodySmall: GoogleFonts.montserrat(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),

          //Body Large
          bodyLarge: GoogleFonts.montserrat(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            backgroundColor: Color.fromARGB(255, 86, 152, 90),
          ),
        ),
      ),
      home: MenuScreen(),
    );
  }
}
