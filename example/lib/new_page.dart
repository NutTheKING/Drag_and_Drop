import 'package:example/page/board_example.dart';
import 'package:flutter/material.dart';

class TestingNewHomeWidget extends StatefulWidget {
  const TestingNewHomeWidget({super.key});

  @override
  State<TestingNewHomeWidget> createState() => _TestingNewHomeWidgetState();
}

class _TestingNewHomeWidgetState extends State<TestingNewHomeWidget> {
  bool isEnable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Switch.adaptive(
            value: isEnable,
            onChanged: (value) {
              isEnable = value;
              setState(() {});
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Container(
          //   height: 250,
          //   color: Colors.amber,
          // ),
          Expanded(
            child: ExampleBoard(
              isEnableButton: isEnable,
            ),
          ),
        ],
      ),
    );
  }
}
