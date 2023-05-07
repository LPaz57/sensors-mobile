import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'dart:async';
import 'package:proximity_sensor/proximity_sensor.dart';


class Proximity extends StatefulWidget {
  @override
  _ProximityState createState() => _ProximityState();
}

class _ProximityState extends State<Proximity> {
  bool _isNear = false;
  late StreamSubscription<dynamic> _streamSubscription;

  @override
  void initState() {
    super.initState();
    listenSensor();
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  Future<void> listenSensor() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (foundation.kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
    };
    _streamSubscription = ProximitySensor.events.listen((int event) {
      setState(() {
        _isNear = (event > 0) ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isNear ?Color.fromARGB(255, 68, 76, 143) : Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        title: const Text('Sensor de Proximidad'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Hay algo cerca ?  $_isNear\n',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: _isNear ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}