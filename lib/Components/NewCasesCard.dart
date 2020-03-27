
import 'package:covid_19/Providers/AppBrain.dart';
import 'package:covid_19/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewCasesCard extends StatelessWidget {
   
   

  @override
  Widget build(BuildContext context) {
    
    return getCard(context);
  }
  Widget getCard(context){
      if (Provider.of<AppBrain>(context).isloading2)
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SpinKitPumpingHeart(color: AppTheme().kcolors[0],),
        ),
      );
      else {
        final countryInfo = Provider.of<AppBrain>(context).countryStats['countrydata'][0];
return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0.5,
              color: Colors.white70,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('New Cases Today',style: GoogleFonts.cabin(fontSize: 25),),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                StatIcon(countryInfo['total_active_cases'], 'Active', AppTheme().kcolors[0]),
                StatIcon(countryInfo['total_new_cases_today'], 'New Cases', AppTheme().kcolors[2]),
                StatIcon(countryInfo['total_new_deaths_today'], 'Deaths', AppTheme().kcolors[1])
              ],),
            )
          ],
        ),
      ),
    );
      }
  }
}
Widget StatIcon(int count,String type,Color color){
  return Column(
    children: <Widget>[
    Text(count.toString(),style: GoogleFonts.cabin(color: color,fontWeight: FontWeight.bold,fontSize: 20),),
    Text(type,style: GoogleFonts.cabin(color: color,fontWeight: FontWeight.bold,fontSize: 20),),
    ],
  );
}