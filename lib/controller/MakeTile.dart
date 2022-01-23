//import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
// ignore: file_names
// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';

class TileMaker extends StatelessWidget {
  TileMaker({this.task, this.isDone, this.toggleFunction});
  final task; //statefull needs to not be final ,where stateless needs to be final
  final isDone;
  final toggleFunction;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      title: Text(
        task,
        style: TextStyle(
            decoration:
                isDone == 1 ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
          value: isDone == 1 ? true : false, onChanged: toggleFunction),
    );
  }
}
