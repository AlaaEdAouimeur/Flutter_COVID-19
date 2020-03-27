
import 'package:covid_19/Components/Charts.dart';
import 'package:covid_19/Components/CountryCard.dart';
import 'package:covid_19/Components/NewCasesCard.dart';
import 'package:covid_19/Components/Title.dart';

import 'package:flutter/material.dart';




class StatesPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
   
     
    return SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
        AppTitle(),
       
        Charts(),
        
        SizedBox(),
   
        CountryCard(),
        NewCasesCard(),
        
       ],
      ),
    );
  }
}