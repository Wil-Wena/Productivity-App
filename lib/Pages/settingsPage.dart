import 'package:flutter/material.dart';
import 'package:productivity_timer/widgets/SettingsButtons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //Constants and variables to interact with Shared Preferences
  static const String WORKTIME = "worktime";
  static const String SHORTBREAK = "shortbreak";
  static const String LONGBREAK = "longbreak";
  late int workTime;
  late int shortBreak;
  late int longBreak;
  late SharedPreferences prefs;

  //Reading and Writing from textfields, it is used
  late TextEditingController txtWork;
  late TextEditingController txtShort;
  late TextEditingController txtLong;

  @override
  void initState() {
    TextEditingController txtWork = TextEditingController();
    TextEditingController txtShort = TextEditingController();
    TextEditingController txtLong = TextEditingController();
    super.initState();
  }

  TextStyle textstyle = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    void readSettings() async {
      prefs = await SharedPreferences.getInstance();
      int? workTime = prefs.getInt(WORKTIME);
      int? shortBreak = prefs.getInt(SHORTBREAK);
      int? longBreak = prefs.getInt(LONGBREAK);
      setState(() {
        txtWork.text = workTime.toString();
        txtShort.text = shortBreak.toString();
        txtLong.text = longBreak.toString();
      });
    }

    //Writes the settings
    void updateSetting(String key, int value) {
      switch (key) {
        case WORKTIME:
          {
            int? workTime = prefs.getInt(WORKTIME);
            workTime = workTime! + value;
            if (workTime >= 1 && workTime <= 180) {
              prefs.setInt(WORKTIME, workTime);
              setState(() {
                txtWork.text = workTime.toString();
              });
            }
          }
          break;
        case SHORTBREAK:
          {
            int? shortBreak = prefs.getInt(SHORTBREAK);
            shortBreak = shortBreak! + value;
            if (shortBreak >= 1 && shortBreak <= 120) {
              prefs.setInt(SHORTBREAK, shortBreak);
              setState(() {
                txtShort.text = shortBreak.toString();
              });
            }
          }
          break;
        case LONGBREAK:
          {
            int? longBreak = prefs.getInt(LONGBREAK);
            longBreak = longBreak! + value;
            if (longBreak >= 1 && longBreak <= 180) {
              prefs.setInt(LONGBREAK, longBreak);
              setState(() {
                txtLong.text = longBreak.toString();
              });
            }
          }
          break;
      }
    }

    @override
    void initState() {
      txtWork = TextEditingController();
      txtShort = TextEditingController();
      txtLong = TextEditingController();
      readSettings();
      super.initState();
    }

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
          SettingButton(color: Colors.blueGrey, text: "-", value: -1),
          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtWork,
          ),
          SettingButton(color: Colors.deepPurple, text: "+", value: 1),

          //Short Widget
          Text("Short", style: textstyle),
          const Text(""),
          const Text(""),
          SettingButton(color: Colors.blueGrey, text: "-", value: -1),
          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtShort,
          ),
          SettingButton(color: Colors.deepPurple, text: "+", value: 1),

          //Long Widget
          Text("Long", style: textstyle),
          const Text(""),
          const Text(""),
          SettingButton(color: Colors.blueGrey, text: "-", value: -1),
          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtLong,
          ),
          SettingButton(color: Colors.deepPurple, text: "+", value: 1),
        ],
      ),
    );
  }
}
