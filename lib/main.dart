
import 'package:covid_19/HomePage.dart';
import 'package:covid_19/Providers/AppBrain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  
  MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(
      
      create: (_) => AppBrain(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        primaryColor:Color(0xff00cc99) ,
         // primarySwatch:  Colors.grey,
          buttonColor:  Color(0xff00cc99),
         // textTheme: TextTheme()
        ),
        home: SafeArea(child: HomePage()),
      ),
    );
  }
}

