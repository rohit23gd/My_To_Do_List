import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/TaskProvider.dart';
//import 'Models/task.dart';
import 'Screen/mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        home: mainscreen(),
      ),
    );
  }
}
