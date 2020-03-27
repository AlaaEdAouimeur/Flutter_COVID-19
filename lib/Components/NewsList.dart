

import 'package:covid_19/Components/NewsCard.dart';
import 'package:covid_19/Helpers/NewsSampleData.dart';
import 'package:covid_19/Providers/AppBrain.dart';
import 'package:covid_19/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int listLength=5;
  ScrollController _scrollController ;
  @override
  void dispose() { 
    _scrollController.removeListener(getListLength);
    super.dispose();
  }
@override
  void initState() {
    
    super.initState();
_scrollController= new ScrollController()..addListener(getListLength);
  }
  void getListLength(){
    if(_scrollController.position.extentAfter<listLength){
      Future.delayed(Duration( milliseconds: 700));
      setState(() {
        listLength+=5;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppBrain>(context).isloading2) {
      return Center(child: SpinKitPulse(color: AppTheme().kcolors[1],),);
    } else {
      Map _news = Provider.of<AppBrain>(context).news['countrynewsitems'][0];
      _news.remove('${_news.length}');
      _news.remove('stat');
      Map news = Map.fromIterables(_news.keys, _news.values.toList().reversed);


      return ListView.builder(
        controller: _scrollController,
        itemCount: listLength,
        itemBuilder: (BuildContext context, i) {
          i++;
          print(i);
          return NewsCard(NewsSampleData(news['$i']['title'],news['$i']['time'], news['$i']['image'], news['$i']['url']));
        },  /* news['$i']['title'],
              news['$i']['time'], news['$i']['image'], news['$i']['url']*/
      );
    }
  }
}