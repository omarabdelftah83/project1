import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextformField extends StatelessWidget {
  // const TextformField({super.key});
  final String text;
  final Color color;
  final TextEditingController editinController;

  const TextformField({
    super.key,
    required this.text,
    required this.color,
    required this.editinController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: TextFormField(
            controller: editinController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.edit,
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
