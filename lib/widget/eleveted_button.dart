import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ElevettedButton extends StatelessWidget {
//const MyWidget({super.key});
  final Color color;
  final VoidCallback onpreseed;

  const ElevettedButton(
      {super.key, required this.color, required this.onpreseed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onpreseed,
        child: Icon(
          Icons.image,
          color: color,
          size: 50,
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
