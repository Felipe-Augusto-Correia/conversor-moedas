import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String label;
  final String prefix;
  final TextEditingController controller;
  final Function function;

  BuildTextField({this.label, this.prefix, this.controller, this.function});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixText: prefix,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.amber,
          fontSize: 25,
        ),
      ),
      style: TextStyle(
        color: Colors.amber,
        fontSize: 25,
      ),
      onChanged: function,
    );
  }
}
