import 'package:flutter/material.dart';
import 'package:sensores/appbar.dart';
import 'package:sensores/button.dart';
import 'package:sensores/camera.dart';
import 'package:sensores/compass.dart';
import 'package:sensores/giroscopio.dart';
import 'package:sensores/info.dart';
import 'package:sensores/proximity.dart';

import 'device_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sensores'),
      // ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            AppBarStack(height: 280, text: 'Sensores e información del dispositivo'),
            SensorButton(
              text: 'Brújula', 
              icon: Icons.explore,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Compass()
                  )
                );
              },
            ),
            
            SensorButton(
              text: 'Giroscopio', 
              icon: Icons.screen_rotation_alt_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Giroscopio()
                  )
                );
              },
            ),
            SensorButton(
              text: 'Proximidad', 
              icon: Icons.near_me_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Proximity()
                  )
                );
              },
            ),
            SensorButton(
              text: 'Camara', 
              icon: Icons.photo_camera,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Camera()
                  )
                );
              },
            ),

            SensorButton(
              text: 'Info. del dispositivo',
              icon: Icons.info,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Info()
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}