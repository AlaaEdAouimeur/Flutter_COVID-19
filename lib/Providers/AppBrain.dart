import 'dart:convert';

import 'package:covid_19/Helpers/ChartSampleData.dart';

import 'package:covid_19/Helpers/InformationSampleData.dart';
import 'package:covid_19/Helpers/SymptomSampleData.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:mailer/mailer.dart' as mailer;

import 'package:mailer/smtp_server.dart' as smtp;

class AppBrain extends ChangeNotifier {
  int myindex = 0;
  Map stats, news, countryStats;
  LocationData locationData;
  InformationSampleData info = new InformationSampleData();
  void iFeelIt(int index) {
    if (index == 8) {
      for (int i = 0; i < lightsymptoms.length - 1; i++) {
        lightsymptoms[i].isfeeling = false;
      }
      lightsymptoms[index].isfeeling = !lightsymptoms[index].isfeeling;
    } else {
      lightsymptoms[index].isfeeling = !lightsymptoms[index].isfeeling;
      report.add(lightsymptoms[index].content);
    }
    notifyListeners();
  }

  get getlength => 9;
  bool issPossible() {
    if (lightsymptoms[8].isfeeling)
      return true;
    else
      return false;
  }


  List<String> report = [];
  List<SympSampleData> heavysymptoms = [
    SympSampleData(
        content:
            'A very hard time breathing? Cannot do normal activities without stopping to catch your breath? Gasping for air?',
        isfeeling: false),
    SympSampleData(
        content:
            'Continuous or severe pain or pressure in your chest? This does not include pain in the chest from coughing.',
        isfeeling: false),
    SympSampleData(
        content: 'Unable to keep down food or drink for the last 12 hours?',
        isfeeling: false),
    SympSampleData(
        content: 'Fatigue (tiredness when doing normal work)',
        isfeeling: false),
    SympSampleData(
        content:
            'Feeling so lightheaded that you fear you may pass out or faint if you stand up?',
        isfeeling: false),
    SympSampleData(
        content:
            'Altered or slurred speech, difficult to wake up or behaving very abnormally?',
        isfeeling: false),
    SympSampleData(
        content:
            'Symptoms that are rapidly getting worse? Or, a fever and cough that went away for a while but have come back and much worse?',
        isfeeling: false),
    SympSampleData(content: 'None of the above', isfeeling: false),
  ];
  void iFeelItH(int index) {
    if (index == 6) {
      for (int i = 0; i < heavysymptoms.length - 1; i++) {
        heavysymptoms[i].isfeeling = false;
      }
      heavysymptoms[index].isfeeling = !heavysymptoms[index].isfeeling;
    } else
      heavysymptoms[index].isfeeling = !heavysymptoms[index].isfeeling;
    notifyListeners();
  }

  get getlengthH => 7;
  bool issPossibleH() {
    if (heavysymptoms[6].isfeeling)
      return false;
    else
      return true;
  }

  List<SympSampleData> lightsymptoms = [
    SympSampleData(content: 'Fever (measured or not)', isfeeling: false),
    SympSampleData(content: 'Cough (new or worse)', isfeeling: false),
    SympSampleData(content: 'Shortness of breath', isfeeling: false),
    SympSampleData(
        content: 'Fatigue (tiredness when doing normal work)',
        isfeeling: false),
    SympSampleData(content: 'Muscle pains', isfeeling: false),
    SympSampleData(content: 'Headache', isfeeling: false),
    SympSampleData(content: 'Diarrhea', isfeeling: false),
    SympSampleData(content: 'Sore throat', isfeeling: false),
    SympSampleData(content: 'None of the above', isfeeling: false),
  ];

//DUMMY DATA
  List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Confirmed', y: 100000, text: ''),
    ChartSampleData(x: 'Dead', y: 7700, text: ''),
    ChartSampleData(x: 'Recoverd', y: 86000, text: ''),
  ];
  int bottomNvIndex = 0;
  bool isloading1 = true, isloading2 = true, havPosition = false;

  void havIt() {
    havPosition = true;
    notifyListeners();
  }

  void setInformation(InformationSampleData info) => this.info = info;
  void jumpToPage(int index) {
    bottomNvIndex = index;
    print(index);
    notifyListeners();
  }

  Future<void> sendMail() async {
    String mapUrl =
        'https://www.google.com/maps/search/?api=1&query=${locationData.latitude},${locationData.longitude}';
    print(info.name);
    final smtpServer = smtp.gmail('*****', '*****');
    final message = mailer.Message()
      ..from = mailer.Address('recipent@gmail.com', 'ANTI COVID-19')
      ..recipients.add('recipent.com')
      ..subject = 'POTETNIAL COVID-19 CASE REPORT';
    message.text = '''Potential COVID-19 case :
     Full Name :  ${info.name}
     Age :${info.age}
     wilaya :${info.wilaya}
     at  latitude: ${locationData.latitude}  & longtitude: ${locationData.longitude} longtitude view in google maps :$mapUrl
     with these symptomps : ''';
    report.forEach((f) => message.text = message.text + '\n- $f');
    message.text = message.text + '\n REQUIRES MEDICAL CARE';
    try {
      final sendReport = await mailer.send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on mailer.MailerException catch (e) {
      print('Message not sent.');
      print(e);
    }
  }

  void getLocation() async {
    try {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();
      locationData = _locationData;

      havIt();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchStats() async {
    try {
      var response = await http.get(
        'https://thevirustracker.com/free-api?global=stats',
      );
      stats = json.decode(response.body)['results'][0];
      // print(stats);
      chartData = <ChartSampleData>[
        ChartSampleData(x: 'Confirmed', y: stats['total_unresolved'], text: ''),
        ChartSampleData(x: 'Dead', y: stats['total_deaths'], text: ''),
        ChartSampleData(x: 'Recoverd', y: stats['total_recovered'], text: ''),
      ];
      isloading1 = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchNews() async {
    try {
      var response = await http.get(
        'https://thevirustracker.com/free-api?countryNewsTotal=DZ',
      );
      var response2 = await http.get(
        'https://thevirustracker.com/free-api?countryTotal=DZ',
      );
      countryStats = json.decode(response2.body);
      news = json.decode(response.body);

      isloading2 = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
