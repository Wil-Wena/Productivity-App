import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productivity_timer/main.dart';
import 'package:productivity_timer/models/timemodel.dart';
import 'package:productivity_timer/widgets/ProductivityButton.dart';
import 'package:productivity_timer/models/timer.dart';

class TimerHomePage extends StatelessWidget {
  final Padding defaultPadding = const Padding(padding: EdgeInsets.all(5.0));
  final CountDownTimer timer = CountDownTimer();
  TimerHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    timer.startWork(); //Called to main screen when it loads.

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Task Scheduler"),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double availableWidth = constraints.maxWidth;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultPadding,
                        const Expanded(
                            child: ProductivityButton(
                                color: Colors.blueAccent,
                                text: "Work",
                                size: 23.5,
                                onPressed: emptyMethod)),
                        defaultPadding,
                        const Expanded(
                            child: ProductivityButton(
                                color: Colors.deepPurple,
                                text: "Short Break",
                                size: 23.5,
                                onPressed: emptyMethod)),
                        defaultPadding,
                        const Expanded(
                            child: ProductivityButton(
                                color: Colors.blueGrey,
                                text: "Long Break",
                                size: 23.5,
                                onPressed: emptyMethod)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: StreamBuilder(
                        initialData: '00:00',
                        stream: timer.stream(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          TimerModel timer = (snapshot.data == '00:00')
                              ? TimerModel('00:00', 1)
                              : snapshot.data;
                          return Expanded(
                              child: CircularPercentIndicator(
                            radius: availableWidth / 3,
                            lineWidth: 25.0,
                            animation: true,
                            percent: 1,
                            center: Text(
                              timer.time,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            progressColor: Colors.deepPurpleAccent,
                          ));
                        }),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        defaultPadding,
                        const Expanded(
                          child: ProductivityButton(
                            color: Colors.deepPurple,
                            text: 'Stop',
                            size: 40.0,
                            onPressed: emptyMethod,
                          ),
                        ),
                        defaultPadding,
                        const Expanded(
                          child: ProductivityButton(
                            color: Colors.blueAccent,
                            text: 'Restart',
                            size: 40.0,
                            onPressed: emptyMethod,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
