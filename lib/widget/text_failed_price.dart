import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFormFailedPrice extends StatelessWidget {
  //const TextFormFailedPrice({super.key});
  final String text;
  final Color color;
  final TextEditingController editinController2;
  const TextFormFailedPrice(
      {super.key,
      required this.text,
      required this.color,
      required this.editinController2});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: TextFormField(
            controller: editinController2,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.price_check,
                color: Colors.black,
              ),
              labelText: text,
              hintStyle: TextStyle(
                color: color,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
