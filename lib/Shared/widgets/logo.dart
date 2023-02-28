import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget applogo({
  String? tagline,
}) =>
    Stack(
      children: [
        SizedBox(
            width: 250,
            height: 250,
            child: Image.asset("images/translogo.png")),
        Positioned(
            left: 50,
            right: 50,
            bottom: 50,
            // top: 100,
            child: Text(
              tagline ?? "",
              style: TextStyle(
                fontFamily: GoogleFonts.josefinSans().fontFamily,
              ),
            )),
      ],
    );
