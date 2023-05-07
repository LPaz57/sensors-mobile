import 'package:flutter/material.dart';
import 'package:sensores/appbar_wave.dart';

class AppBarStack extends StatelessWidget {
  final double height;
  final String text;

  const AppBarStack({Key? key, required this.height, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBarWave(height: height),
        Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],     
    );
  }
}