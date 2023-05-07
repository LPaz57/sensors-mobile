
import 'package:flutter/material.dart';
import 'package:sensores/appbar.dart';
import 'package:sensores/connectivity_info.dart';
import 'package:sensores/button.dart';

import 'device_info.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

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
            AppBarStack(height: 280, text: 'Información del dispositivo'),
            SensorButton(
              text: 'Info. del sistema', 
              icon: Icons.info,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeviceInfo()
                  )
                );
              },
            ),
            
            SensorButton(
              text: 'Info. de conectividad', 
              icon: Icons.wifi,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConnectivityInfo()
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