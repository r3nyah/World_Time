import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    try {
      data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    }
    catch (e) {
      data = data;
    }
    print(data);

    String bgImage = data['isDaytime'] ? 'daycat.jpg' : 'nightcat.jpg' ;
    Color?bgColor = data['isDaytime'] ? Colors.blue[200] : Colors.grey[900];
    Color?txtColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      //appBar: AppBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 150.0),
              FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: txtColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: txtColor,
                    ),
                  )
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: txtColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 66.0,
                    color: txtColor,
                  ),
              ),
              SizedBox(height: 50.0),
              SpinKitPumpingHeart(
                color: Colors.pink[600],
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}