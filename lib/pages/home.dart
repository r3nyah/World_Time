import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }
    catch (e) {
      data = data;
    }
    print(data);

    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text(
                    'Edit Location'
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
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 66.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}