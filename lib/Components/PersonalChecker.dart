


import 'package:covid_19/Helpers/InformationSampleData.dart';
import 'package:covid_19/Providers/AppBrain.dart';
import 'package:covid_19/utils/Styles.dart';
import 'package:covid_19/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class PersonalChecker extends StatelessWidget {
  InformationSampleData info;
  final _formkey = GlobalKey<FormState>();
  bool havPosition = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autovalidate: true,
            maxLength: 30,
            onFieldSubmitted: (val){
                 Provider.of<AppBrain>(
                context,listen: false
              ).info.name=val;
            },
          
            validator: (val){
              if(val.length<=5) return 'Name is too short';
              if(val.contains(RegExp('[0-9]'))) return 'Name must contain Alphabets only';

            },
            keyboardType: TextInputType.text,
         
            decoration: inputDecoration.copyWith(hintText: 'Full Name'),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            autovalidate: true,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (string){
                Provider.of<AppBrain>(
                context,listen: false
              ).info.age=int.parse(string);
            },
            validator: (val){
             if( val.contains('-') ||  val.contains('.')) return 'Invalid Age';
            },
            decoration: inputDecoration.copyWith(
              hintText: 'Age',
            ),
          ),
          SizedBox(
            height: 12,
          ),
           TextFormField(
             autovalidate: true,
            keyboardType: TextInputType.number,
             onFieldSubmitted: (string){
               Provider.of<AppBrain>(
                context,listen: false
              ).info.wilaya=int.parse(string);

             
            },
            validator: (val){
             if( val.contains('-') ||  val.contains('.')) return 'Invalid number';
            },
            decoration: inputDecoration.copyWith(
              hintText: 'Wilaya number',
            ),
            
          ),
          SizedBox(
            height: 12,
          ),
          OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              onPressed: Provider.of<AppBrain>(
                context,
              ).havPosition
                  ? null
                  : () async {
                      Provider.of<AppBrain>(context, listen: false)
                          .getLocation();
                    },
              child: Provider.of<AppBrain>(
                context,
              ).havPosition
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          LineIcons.check_circle,
                          color: AppTheme().kcolors[2],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('Done', style: GoogleFonts.cabin()),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          LineIcons.location_arrow,
                          color: AppTheme().kcolors[2],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('Get Location', style: GoogleFonts.cabin()),
                      ],
                    ))
        ],
      ),
    );
  }
}
