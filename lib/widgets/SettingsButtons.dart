import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingButton extends StatelessWidget {
  SettingButton({required this.color, required this.text, required this.value});

  final Color color;
  final String text;
  final int value;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
      color: this.color,
    );
  }
}
