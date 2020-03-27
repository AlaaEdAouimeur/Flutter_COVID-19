
import 'package:covid_19/Providers/AppBrain.dart';

import 'package:covid_19/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeavyChecker extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
     final appbrain = Provider.of<AppBrain>(context);
    return Container(
          child: ListView.builder(
        key: Key('re'),
         
        itemCount: appbrain.getlengthH,
        itemBuilder: (BuildContext context,i){
           
          return CheckboxListTile(
          //  dense: ,
       activeColor: AppTheme().kcolors[2],
            value:appbrain.heavysymptoms[i].isfeeling ,
            onChanged: (val){ appbrain.iFeelItH(i);},
            title: Text(appbrain.heavysymptoms[i].content,style: GoogleFonts.cabin(),),

          );
        }
        ),
    );
  }
}