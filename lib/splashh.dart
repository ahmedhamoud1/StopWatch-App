import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch/splash.dart';

class Splashh extends StatefulWidget {
  const Splashh({Key? key}) : super(key: key);

  @override
  _SplashhState createState() => _SplashhState();
}

class _SplashhState extends State<Splashh> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(milliseconds: 2500),() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Splash()), (route) => false)) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1F22),
      appBar: AppBar(
        backgroundColor: Color(0xff1E1F22),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          Center(
            child: Image(
              image: AssetImage('images/1.png'),
              // fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }
}
