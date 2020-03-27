import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTitle extends StatelessWidget {
  String title;
  CardTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
     title,style: GoogleFonts.cabin(fontSize: 30,color: Colors.black87),
    );
  }
}