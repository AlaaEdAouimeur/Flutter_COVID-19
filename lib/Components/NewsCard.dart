import 'package:covid_19/Helpers/NewsSampleData.dart';
import 'package:covid_19/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsCard extends StatelessWidget {
 NewsSampleData newsSampleData;
 
 NewsCard(this.newsSampleData);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          if (await canLaunch(newsSampleData.url))
            await launch(
            
              newsSampleData.url,
              forceSafariVC: true,
              forceWebView: true,
            
              enableJavaScript: true
            );
        },
        child: Container(
          
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height*0.21,
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.09),
                  blurRadius: 20,
                  spreadRadius: 3.5,
                  offset: Offset(0, 13)),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 100,
                      margin: EdgeInsets.all(15),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffD6D6D6).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Algerian News",
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                              color: Colors.grey[400], fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            newsSampleData?.title ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                    color: Color(0xff243358),
                                    fontWeight: FontWeight.bold),
                                fontSize: 16),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            newsSampleData?.time ?? "",
                            style: GoogleFonts.cabin(
                              textStyle: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Flexible(
                flex: 4,
                child: Container(
                  child: TransitionToImage(
enableRefresh: true,
loadingWidget: SpinKitFadingCircle(color: AppTheme().kcolors[1],),
                    fit: BoxFit.cover,
                    image: AdvancedNetworkImage(
        
                                newsSampleData?.img,
                               useDiskCache: true,
                                retryLimit: 10,
                                timeoutDuration: Duration(seconds: 10),
                                
                              ),
                          //    placeholder: 
                            //  forceRebuildWidget: true,
                              ),
                              foregroundDecoration:  BoxDecoration(
                 //     color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      ),
                height: MediaQuery.of(context).size.height*0.21,
                
                ),
              )
            ],
          ),
        )
        
        );
  }
}