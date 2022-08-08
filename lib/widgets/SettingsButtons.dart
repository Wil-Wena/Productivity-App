import 'package:flutter/material.dart';

typedef CallbackSetting = void Function(String, int);

class SettingButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;
  final double size;
  final String setting;
  final CallbackSetting callback;

  SettingButton(
      {required this.color,
      required this.text,
      required this.size,
      required this.value,
      required this.setting,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        callback(setting, value);
      },
      color: color,
      minWidth: size,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
