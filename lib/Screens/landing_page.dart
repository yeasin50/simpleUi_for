import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget {
  static final String routeName = "landingScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: 223,
            height: 85,
            color: const Color(0xffC4C4C4).withOpacity(.43),
            child: Text(
              "Create",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.37,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
