import 'package:covid_19/Components/NewsList.dart';
import 'package:covid_19/Components/Title.dart';

import 'package:flutter/material.dart';


class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
     Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: AppTitle(),flex: 1,),
          Expanded(child: NewsList(),flex:5)
          
        ],
      
    );
  }
}
