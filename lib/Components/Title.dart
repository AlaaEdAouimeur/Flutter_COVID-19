import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTitle extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
            Text('Anti', style: GoogleFonts.oswald(textStyle: TextStyle(color: Colors.black45,fontSize: 20)),),
            SizedBox(height: 0,),
            Text('Covid-19', style: GoogleFonts.cabin(textStyle: TextStyle(color: Colors.black87,fontSize: 25,fontWeight: FontWeight.bold))),
        ],
      ),
    );  
  }
}