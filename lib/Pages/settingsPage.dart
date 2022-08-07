import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:productivity_timer/widgets/SettingsButtons.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextStyle textstyle = const TextStyle(fontSize: 24);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          //Work Widget
          Text("Work", style: textstyle),
          const Text(""),
          const Text(""),
          SettingButton(color: Colors.deepPurple, text: "-", value: -1),
          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(color: Colors.deepPurple, text: "+", value: 1),

          //Short Widget
          Text("Short", style: textstyle),
          const Text(""),
          const Text(""),
          SettingButton(
              color: Color.fromARGB(255, 68, 50, 99), text: "-", value: -1),
          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
              color: Color.fromARGB(255, 68, 50, 99), text: "+", value: 1),

          //Long Widget
          Text("Long", style: textstyle),
          const Text(""),
          const Text(""),
          SettingButton(color: Colors.blueGrey, text: "-", value: -1),
          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(color: Colors.blueGrey, text: "+", value: 1),
        ],
      ),
    );
  }
}
