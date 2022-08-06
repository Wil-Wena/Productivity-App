import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            title: const Text("My time Controller"),
          ),
          body: Column(
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
                            color: Colors.blueAccent,
                            text: "Short Break",
                            size: 23.5,
                            onPressed: emptyMethod)),
                    defaultPadding,
                    const Expanded(
                        child: ProductivityButton(
                            color: Colors.blueAccent,
                            text: "Long Break",
                            size: 23.5,
                            onPressed: emptyMethod)),
                  ],
                ),
              ),
              const Expanded(child: Text("Timer Under Construction")),
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
                          color: Colors.deepPurple,
                          text: 'Restart',
                          size: 40.0,
                          onPressed: emptyMethod),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
