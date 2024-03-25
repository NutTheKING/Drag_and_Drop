import 'package:flutter/material.dart';
import 'package:flutter_drag_and_drop_list/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ShakeDemo(),
      home: const TestingNewHomeWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class Testingssssss extends StatefulWidget {
//   const Testingssssss({super.key});

//   @override
//   State<Testingssssss> createState() => _TestingssssssState();
// }

// class _TestingssssssState extends State<Testingssssss> {
//   bool isTrue = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: Center(
//         child: Container(
//           color: isTrue ? Colors.amber : Colors.black,
//           padding: const EdgeInsets.all(10.0),
//           width: 200,
//           height: 50,
//           child: Text('hello $isTrue'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           isTrue = !isTrue;
//           setState(() {});
//           debugPrint('hello $isTrue');
//         },
//       ),
//     );
//   }
// }
