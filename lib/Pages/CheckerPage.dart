import 'package:covid_19/Components/HeavySympChecker.dart';
import 'package:covid_19/Components/PersonalChecker.dart';
import 'package:covid_19/Components/SymptomsChecker.dart';

import 'package:covid_19/Providers/AppBrain.dart';
import 'package:covid_19/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import 'package:provider/provider.dart';
import 'package:undraw/undraw.dart';



class CheckerPage extends StatefulWidget {
 

  @override
  _CheckerPageState createState() => _CheckerPageState();
}

class _CheckerPageState extends State<CheckerPage> {
   int _currentStep=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      //  Expanded(child: AppTitle(),flex: 1,),
   Expanded(
     flex: 5,
        child: Stepper(

key: Key('hello'),
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepTapped: (int step){
            
            },
            onStepContinue: (){
              
         setState(() {
            if(_currentStep==1 && Provider.of<AppBrain>(context,listen: false).issPossible()) 
            {
              _currentStep=3;
               AlertDialog alert= new AlertDialog(
                content: Text('You did not report any COVID-19 symptoms', style: GoogleFonts.cabin()),
                 title:  Text('In the mean time make sure to check the guide page to protect your self and your closest', style: GoogleFonts.cabin(fontWeight: FontWeight.bold)),
                 actions: <Widget>[
                   FlatButton(
                     color: AppTheme().kcolors[2],
                     onPressed: ()async{
                       Provider.of<AppBrain>(context,listen: false).sendMail();
                      Navigator.pop(context);
                     }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          LineIcons.warning,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('Report', style: GoogleFonts.cabin(color: Colors.white)),
                      ],
                    ))
                 ],
              );
              showDialog(context: context,builder: (BuildContext context) => alert);
            }
            
            else if(_currentStep==3){
              
              AlertDialog alert= new AlertDialog(
                content: Text('The symptomps you report do occur in some people with COVID-19', style: GoogleFonts.cabin()),
                 title:  Text('Please seek medical care immediately', style: GoogleFonts.cabin(fontWeight: FontWeight.bold)),
                 actions: <Widget>[
                   FlatButton(
                     color: AppTheme().kcolors[1],
                     onPressed: ()async{
                      
                      Navigator.pop(context);
                     }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          LineIcons.warning,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('Report', style: GoogleFonts.cabin(color: Colors.white)),
                      ],
                    ))
                 ],
              );
              showDialog(context: context,builder: (BuildContext context) => alert);
            }
            else _currentStep<3? _currentStep++ : null;
         });
            },
            onStepCancel: _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,

            steps: <Step>[
              new Step(
              
                title: new Text('Informations'),
                content:  PersonalChecker(),
                isActive: _currentStep >= 0,
                state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              new Step(
                title: new Text('Light Symptoms'),
                content:Container(child: SymptomsChecker(),height: 510,),
                isActive: _currentStep >= 0,
                state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              new Step(
                title: new Text('Heavy Symptoms'),
                content: Container(child: HeavyChecker(),height: 500,),
                isActive: _currentStep >= 0,
                state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              new Step(
                title: new Text('Results'),
                content: UnDraw(illustration: UnDrawIllustration.winter_designer, color: AppTheme().kcolors[2],height: 100,),
                isActive: _currentStep >= 0,
                state: _currentStep >=  3? StepState.complete : StepState.disabled,
              ),
            ],
          ),
   )
      ],
    );
  }
}