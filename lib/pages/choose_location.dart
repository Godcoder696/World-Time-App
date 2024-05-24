import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance= locations[index];
    await instance.getTime();

    Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments:{
          'location': instance.location,
          'time': instance.time,
          'flag': instance.flag,
          'isDayTime': instance.isDayTime
        }
    );
  }

  @override
  void initState(){
    // getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(
                    '${locations[index].location}',
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/${locations[index].flag}'
                  ),
                ),

              ),
            );
          },
          itemCount: locations.length
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
