import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location ; //location name for the UI
  String time = ''; // the time in that location
  String flag ; // url to an asset flag icon
  String url ;  //location url for api end point

   WorldTime({required this.location ,required this.flag,required this.url});

      Future <void> getTime() async{
        try {
          Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
          Map data = jsonDecode(response.body);
          String dateTime = data['datetime'];
          String offset = data['utc_offset'].substring(1,3);
          DateTime now = DateTime.parse(dateTime);
          now = now.add(Duration(hours: int.parse(offset)));
          //set the time
          time = now.toString();
          }
       catch(e) {
           print('error $e');
           time = 'could not get time data';
        }
        
  }
}

