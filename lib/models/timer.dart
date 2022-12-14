// ignore_for_file: prefer_if_null_operators

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:productivity_timer/Pages/settingsPage.dart';
import 'package:productivity_timer/models/timemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountDownTimer {
  double _radius = 1;
  bool _isActive = true;
  late Timer timer;
  late Duration _time;
  late Duration _fullTime;
  int work = 30;
  int shortBreak = 5;
  int longBreak = 20;

  String returnTime(Duration t) {
    String minutes =
        (t.inMinutes < 10) ? '0${t.inMinutes}' : t.inMinutes.toString();
    int numSecs = t.inSeconds - (t.inMinutes * 60);
    String seconds = (t.inSeconds < 10) ? '0$numSecs' : numSecs.toString();

    String formattedTime = "$minutes:$seconds";
    return formattedTime;
  }

  Stream<TimerModel> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      String Mtime;
      // ignore: unnecessary_this
      if (this._isActive) {
        _time = _time - const Duration(seconds: 1);
        _radius = _time.inSeconds / -_fullTime.inSeconds;
        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }
      Mtime = returnTime(_time);
      return TimerModel(Mtime, _radius);
    });
  }

  Future readSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    work = (prefs.getInt('workTime') == null ? 30 : prefs.getInt('workTime'))!;
    shortBreak =
        (prefs.getInt('shortBreak') == null ? 10 : prefs.getInt('shortBreak'))!;
    longBreak =
        (prefs.getInt('longBreak') == null ? 20 : prefs.getInt('longBreak'))!;
  }

  void startWork() async {
    await readSettings();
    _radius = 1;
    _time = Duration(minutes: work, seconds: 0);
    _fullTime = _time;
  }

  void stopTimer() {
    _isActive = false;
  }

  void startTimer() {
    if (_time.inSeconds > 0) {
      _isActive = true;
    }
  }

  void startBreak(bool isShort) {
    _radius = 1;
    _time = Duration(minutes: (isShort) ? shortBreak : longBreak, seconds: 0);
    _fullTime = _time;
  }

  void gotoSettings(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SettingsPage()));
  }
}
