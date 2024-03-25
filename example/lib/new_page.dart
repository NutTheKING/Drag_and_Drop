import 'package:flutter/material.dart';
import 'package:flutter_drag_and_drop_list/page/board_ex.dart';

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
      appBar: AppBar(title: const Text('Home')),
      body: ExampleBoard(
        isEnableButton: isEnable,
      ),
    );
  }
}
