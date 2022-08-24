import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  int seconds = 0 , minutes = 0 , hours = 0 ;
  String digitSeconds = '00' , digitMiuntes = '00' , digitHours = '00' ;
  Timer ? timer ;
  bool Started = false ;
  List Laps = [];

  void stop()
  {
    timer!.cancel();
    setState(() {
      Started = false;
    });
  }
  void reset()
  {
    timer!.cancel();
    setState(() {
      seconds = 0 ;
      minutes = 0 ;
      hours = 0 ;
      digitSeconds = '00';
      digitMiuntes = '00';
      digitHours = '00';
      Started = false;
    });
  }
  void addLaps()
  {
    String lap = '$digitHours : $digitMiuntes : $digitSeconds';
    setState(() {
      Laps.add(lap);
    });
  }
  
  void start()
  {
    Started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1 ;
      int localMinutes = minutes;
      int localHours = hours;

      if(localSeconds>59)
      {
        if(localMinutes>59)
        {
          localHours++ ;
          localMinutes = 0;
        }
        else
          {
            localMinutes ++;
            localSeconds = 0;
          }
      }
      setState(() {
        seconds = localSeconds ;
        minutes = localMinutes ;
        hours = localHours ;
        digitSeconds = (seconds>= 10) ? "$seconds":"0$seconds";
        digitMiuntes = (minutes>= 10) ? "$minutes":"0$minutes";
        digitHours = (hours>= 10) ? "$hours":"0$hours";
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1F22),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              Center(
                child:
                Column(
                  children:
                  [
                    Text(
                      'Stop Watch'.toUpperCase(),
                      style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(5)
                      ),
                      width: 150,
                      height: 3,
                    )
                  ],
                )
              ),
              SizedBox(
                height: 30,),
              Center(
                  child: Text(
                    '$digitHours:$digitMiuntes:$digitSeconds',
                    style: TextStyle(color: Colors.white,fontSize: 82,fontWeight: FontWeight.w600),),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: 
                [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListView.builder(
                      itemBuilder: (context,index)
                      {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                            [
                              Text(
                                'Lap n^ ${index+1}',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),),
                              Text(
                                '${Laps[index]}',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        );
                      },
                      itemCount: Laps.length,

                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children:
                    [
                      Expanded(
                       child: RawMaterialButton(
                         fillColor: Colors.white,
                         shape: const StadiumBorder(
                           side: BorderSide(color: Colors.black87),
                         ),
                         onPressed: () {
                         (!Started) ? start() : stop() ;},
                         child: Text((!Started) ? 'Start' : 'Pause',style: TextStyle(color: Colors.black87,fontSize: 17),),
                       ),
                     ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(onPressed: ()
                      {
                        addLaps();
                      },
                          icon: Icon(Icons.flag,color: Colors.white,)),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: RawMaterialButton(
                          fillColor: Colors.white,
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.black87),
                          ),
                          onPressed: (){
                            reset();
                          },
                          child: Text('Reset',style: TextStyle(color: Colors.black87,fontSize: 17),),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
