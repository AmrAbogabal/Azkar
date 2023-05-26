import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home() ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Expanded(child: Center(
              child: CircleAvatar(backgroundImage: AssetImage('images/pexels-photo-15587290.jpeg',),
                radius: MediaQuery.of(context).size.width,),
            )),
            Row(children: [
              Spacer(),
              Text("الَّذِينَ يَذْكُرُونَ اللَّهَ قِيَامًا وَقُعُودًا وَعَلَى جُنُوبِهِمْ ِ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Spacer(),
            ],)

          ],
        ),
      ),

    );
  }
}
