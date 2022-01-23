import 'package:flutter/material.dart';
import 'package:mytodo/Models/TaskProvider.dart';
import 'MakeTile.dart';
import 'package:provider/provider.dart';

class MakeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskProvider>(context);
    return ListView.builder(
        itemCount: taskData.Totaltask,
        itemBuilder: (context, val) {
          return TileMaker(
            task: taskData.getMyList[val].text,
            isDone: taskData.getMyList[val].isDone,
            toggleFunction: (value) {
              Provider.of<TaskProvider>(context, listen: false)
                  .toogleisDone(val);
            },
          );
        });
  }
}
