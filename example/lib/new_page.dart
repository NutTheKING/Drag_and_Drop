import 'package:example/slidable/action.dart';
import 'package:example/slidable/action_pane_motion.dart';
import 'package:example/slidable/slidable.dart';
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
      body: Center(
        child: Slidable(
          startActionPane: ActionPane(
            dismissible: const Icon(Icons.home),
            motion: const BehindMotion(),
            children: [
              SlidableAction(onPressed: (context) {}, icon: Icons.phone),
              SlidableAction(onPressed: (context) {}, icon: Icons.phone),
            ],
          ),
          endActionPane: ActionPane(
            dismissible: const Icon(Icons.delete),
            motion: const BehindMotion(),
            children: [
              SlidableAction(onPressed: (context) {}, icon: Icons.edit),
              SlidableAction(onPressed: (context) {}, icon: Icons.delete),
            ],
          ),
          child: Container(
            color: Colors.grey,
            child: const ListTile(
              title: Text('Tinut Chan'),
              subtitle: Text(
                '2020202',
                style: TextStyle(height: 4),
              ),
              leading: CircleAvatar(),
            ),
          ),
        ),
      ),
    );
  }
}
