// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sensores/button.dart';

class ConnectivityInfo extends StatefulWidget {
  const ConnectivityInfo({Key? key}) : super(key: key);

  @override
  State<ConnectivityInfo> createState() => _ConnectivityInfoState();
}

class _ConnectivityInfoState extends State<ConnectivityInfo> {
  String connectionStatus = "---";

  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print("Status de conectividad: $result");
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 114, 198, 251),
        title: const Text("Connectivity Info"),
        centerTitle: true,
        leading:  IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SensorButton(
              text: 'Verificar conexion',
              icon: Icons.wifi_find, 
              onPressed: (){
                checkStatus();
              }
            ),
            SizedBox(height: 20,),
            Text(connectionStatus, style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }

  void checkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Conectado a una red móvil");
      setState(() {
        connectionStatus = "Conectado a una red móvil";
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Conectado a una red wifi");
      setState(() {
        connectionStatus = "Conectado a una red wifi";
      }
      );
    } else {
      print("No se encuentra conectado a una red");
      setState(() {
        connectionStatus = "No se encuentra conectado a una red";
      });
    }
  }
}