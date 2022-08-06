import 'dart:async';
import './timemodel.dart';

class CountDownTimer {
  double? _radius = 1;
  bool? _isActive = true;
  Timer? timer;
  Duration? _timer;
  Duration? _fullTime;
}
