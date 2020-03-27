
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:url_launcher/url_launcher.dart';
 
class InformationTitleCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;
  final  String url;
  const InformationTitleCard({Key key, @required this.title, @required this.subTitle, @required this.icon, @required this.iconColor,@required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return InkWell(
       onTap: () async {
         print('tap');
          if (await canLaunch(url))
            await launch(
            
              url,
              forceSafariVC: true,
              forceWebView: true,
            
              enableJavaScript: true
            );
        },
          child: Container(
        height: hp(13),
        width: wp(100),
        padding: EdgeInsets.all(20),
        //margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            new BoxShadow(
                color: Colors.grey[100],
                blurRadius: 4.0,
                spreadRadius: 3.5,
                offset: Offset(0.0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                        child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(icon, size: 50, color: iconColor,),
                  SizedBox(width: wp(5)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: GoogleFonts.cabin(color: Color(0xff4e585a), fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: hp(1)),
                      Text(subTitle, style: GoogleFonts.cabin(color: Color(0xff4e585a).withOpacity(0.5), fontSize: 16))
                    ],
                  )
                ]
              ),
            )
          ]
        ),
      ),
    );
  }
}