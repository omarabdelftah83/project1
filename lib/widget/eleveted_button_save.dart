import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ElevetedButton_Save extends StatelessWidget {
  //const ElevetedButton_Save({super.key});
  final String text;
  final VoidCallback? onpreseed;
  final Color color;

  const ElevetedButton_Save(
      {super.key,
      required this.text,
      required this.onpreseed,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onpreseed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
