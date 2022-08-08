// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:productivity_timer/widgets/SettingsButtons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //Constants and variables to interact with Shared Preferences
  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";

  int? workTime;
  int? shortBreak;
  int? longBreak;
  SharedPreferences? prefs;

  //Reading and Writing from textfields, it is used
  //TextEditingController? txtWork;
  //TextEditingController? txtShort;
  //TextEditingController? txtLong;
  TextEditingController txtWork = TextEditingController();
  TextEditingController txtShort = TextEditingController();
  TextEditingController txtLong = TextEditingController();
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
    readSettings() async {
      prefs = await SharedPreferences.getInstance();
      int? workTime = prefs?.getInt(WORKTIME);
      //Setting Default value for WorkTime when the user enters into the page
      if (workTime == null) {
        await prefs!.setInt(WORKTIME, int.parse('30'));
      }
      int? shortBreak = prefs?.getInt(SHORTBREAK);
      //Setting Default value for ShortTime when the user enters into the page
      if (shortBreak == null) {
        await prefs?.setInt(SHORTBREAK, int.parse('10'));
      }
      int? longBreak = prefs?.getInt(LONGBREAK);
      //Setting Default value for LongTime when the user enters into the page
      if (longBreak == null) {
        await prefs?.setInt(LONGBREAK, int.parse('20'));
      }
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
            int? workTime = prefs?.getInt(WORKTIME);
            workTime = (workTime! + value);
            if (workTime >= 1 && workTime <= 180) {
              prefs?.setInt(WORKTIME, workTime);
              setState(() {
                txtWork.text = workTime.toString();
              });
            }
          }
          break;
        case SHORTBREAK:
          {
            int? shortBreak = prefs?.getInt(SHORTBREAK);
            shortBreak = shortBreak! + value;
            if (shortBreak >= 1 && shortBreak <= 120) {
              prefs?.setInt(SHORTBREAK, shortBreak);
              setState(() {
                txtShort.text = shortBreak.toString();
              });
            }
          }
          break;
        case LONGBREAK:
          {
            int? longBreak = prefs?.getInt(LONGBREAK);
            longBreak = longBreak! + value;
            if (longBreak >= 1 && longBreak <= 180) {
              prefs?.setInt(LONGBREAK, longBreak);
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
          SettingButton(
              color: Colors.blueGrey,
              text: "-",
              size: 23,
              value: -1,
              setting: WORKTIME,
              callback: updateSetting),
          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtWork,
          ),
          SettingButton(
              color: Colors.deepPurple,
              text: "+",
              size: 23,
              value: 1,
              setting: WORKTIME,
              callback: updateSetting),

          //Short Widget
          Text("Short", style: textstyle),
          const Text(""),
          const Text(""),
          SettingButton(
              color: Colors.blueGrey,
              text: "-",
              size: 23,
              value: -1,
              setting: SHORTBREAK,
              callback: updateSetting),

          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtShort,
          ),
          SettingButton(
              color: Colors.deepPurple,
              text: "+",
              size: 23,
              value: 1,
              setting: SHORTBREAK,
              callback: updateSetting),

          //Long Widget
          Text("Long", style: textstyle),
          const Text(""),
          const Text(""),
          SettingButton(
              color: Colors.blueGrey,
              text: "-",
              size: 23,
              value: -1,
              setting: LONGBREAK,
              callback: updateSetting),

          TextField(
            style: textstyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtLong,
          ),
          SettingButton(
              color: Colors.deepPurple,
              text: "+",
              size: 23,
              value: 1,
              setting: LONGBREAK,
              callback: updateSetting),
        ],
      ),
    );
  }
}
