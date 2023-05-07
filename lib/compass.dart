import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Compass extends StatefulWidget {
  const Compass({super.key});

  @override
  State<Compass> createState() => _compasState();
}

class _compasState extends State<Compass> {

  double? heading = 0;
  StreamSubscription<CompassEvent>? subscription;

  @override
  void initState() {
    super.initState();

  subscription = 
      FlutterCompass.events!.listen((event) {
        setState(() {
          heading = event.heading;
        });
      }
    ); 
  }

  @override
  void dispose(){
    subscription?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          //elevation: 0,
          title: Text('Brujula'),
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${heading!.ceil()}°",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 50.0,),

            Padding(
              padding: EdgeInsets.all(18.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/img/cadrant.png"),
                  Transform.rotate(angle: ((heading ?? 0) * (pi / 180) * -1),
                    child: Image.asset(
                      "assets/img/compass.png", 
                      scale: 1.1
                    ),
                  ),
                  
                ],
              ),
            )
          ]
        ),
    );
  }
}