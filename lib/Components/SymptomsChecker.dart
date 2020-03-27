import 'package:covid_19/Providers/AppBrain.dart';
import 'package:covid_19/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class SymptomsChecker extends StatelessWidget {
  
bool az=false;
  @override
  Widget build(BuildContext context) {
    final appbrain = Provider.of<AppBrain>(context);
    return Container(
          child: ListView.builder(
        key: Key('re'),
         
        itemCount: appbrain.getlength,
        itemBuilder: (BuildContext context,i){
           
          return CheckboxListTile(
          //  dense: ,
       activeColor: AppTheme().kcolors[2],
            value:appbrain.lightsymptoms[i].isfeeling ,
            onChanged: (val){ appbrain.iFeelIt(i);},
            title: Text(appbrain.lightsymptoms[i].content,style: GoogleFonts.cabin(),),

          );
        }
        ),
    );
    
  }
}