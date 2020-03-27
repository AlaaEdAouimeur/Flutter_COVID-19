import 'package:covid_19/Helpers/ChartSampleData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLegend extends StatelessWidget {
  ChartSampleData legend;
  Color color;
 MyLegend(this.legend,this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(legend.y.toString(),style: GoogleFonts.arvo(fontSize: 20),),
        SizedBox(height: 2,),
        Text(legend.x,style: GoogleFonts.arvo(fontSize: 19,color: color,fontWeight: FontWeight.bold),),
      ],
    );
  }
}