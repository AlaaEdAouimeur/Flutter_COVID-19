import 'package:covid_19/Components/InformationCard.dart';
import 'package:covid_19/Components/Title.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class InformationPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
        AppTitle(),
       InformationTitleCard(title: 'How it spreads', subTitle: 'Learn how Covid-19 spread', icon: LineIcons.share_alt, iconColor: Color(0xff356de4),url: 'https://www.cdc.gov/coronavirus/2019-ncov/prepare/transmission.html',),
      // SizedBox(height: hp(3),),
       InformationTitleCard(title: 'Symptoms', subTitle: 'Learn how Covid-19 symptoms', icon: LineIcons.warning, iconColor:Color(0xff3db6ba),url:'https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/symptoms.html' ,) ,
     //  SizedBox(height: hp(3),),
       InformationTitleCard(title: 'Prevention & treatment', subTitle: 'Learn how Covid-19 treatments', icon: LineIcons.heartbeat, iconColor: Color(0xffe54141),url: 'https://www.cdc.gov/coronavirus/2019-ncov/hcp/therapeutic-options.html',),
    //   SizedBox(height: hp(3),),
       InformationTitleCard(title: 'What to do', subTitle: 'What to do if you get Covid-19', icon: LineIcons.question_circle, iconColor: Color(0xff61bd80),url: 'https://www.cdc.gov/coronavirus/2019-ncov/if-you-are-sick/steps-when-sick.html',),
     
       ],
      );
  }
}