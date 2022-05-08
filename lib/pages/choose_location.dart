import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  //int counter = 0;
  void getData() async{
    String username = await Future.delayed(Duration(seconds: 3), (){
      return 'r3nyah';
    });

    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'i`m human';
    });
    print('$username - $bio');
  }


  @override
  void initState() {
    super.initState();
    getData();
    print('hey there!');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}