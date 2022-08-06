import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productivity_timer/main.dart';
import 'package:productivity_timer/widgets/ProductivityButton.dart';

class TimerHomePage extends StatelessWidget {
  final Padding defaultPadding = const Padding(padding: EdgeInsets.all(5.0));

  const TimerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: Expanded(
                        child: CircularPercentIndicator(
                      radius: availableWidth / 3,
                      lineWidth: 10.0,
                      percent: 1,
                      center: Text(
                        "30.00",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      progressColor: Colors.deepPurpleAccent,
                    )),
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
                              onPressed: emptyMethod),
                        ),
                        defaultPadding,
                        const Expanded(
                          child: ProductivityButton(
                              color: Colors.blueAccent,
                              text: 'Restart',
                              size: 40.0,
                              onPressed: emptyMethod),
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
