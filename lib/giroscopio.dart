import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Giroscopio extends StatefulWidget {
  const Giroscopio({super.key});

  @override
  State<Giroscopio> createState() => _GiroState();
}

class _GiroState extends State<Giroscopio> {

  double posX = 180, posY = 350;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Giroscopio'),
      ),
      body:
        StreamBuilder<GyroscopeEvent>(
          stream: SensorsPlatform.instance.gyroscopeEvents,
          builder: (context, snapshot) {
            // print("");
            if (snapshot.hasData) {
              posX = posX + (snapshot.data!.y*10);
              posY = posY + (snapshot.data!.x*10);
            }
            return Transform.translate(
              offset: Offset(posX, posY),
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }
        ),
    );
  }
}