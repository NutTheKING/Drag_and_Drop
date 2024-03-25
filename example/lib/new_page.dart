import 'package:example/page/board_ex.dart';
import 'package:flutter/material.dart';

class TestingNewHomeWidget extends StatefulWidget {
  const TestingNewHomeWidget({super.key});

  @override
  State<TestingNewHomeWidget> createState() => _TestingNewHomeWidgetState();
}

class _TestingNewHomeWidgetState extends State<TestingNewHomeWidget> {
  bool isEnable = false;
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
      body: ExampleBoard(
        isEnableButton: isEnable,
      ),
    );
  }
}
