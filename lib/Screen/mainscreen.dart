// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mytodo/Models/TaskProvider.dart';
import 'package:mytodo/Screen/alert.dart';
import 'package:mytodo/controller/makelist.dart';
import 'package:provider/provider.dart';
import 'bottomScreen.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).setdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Bottom_adder_sheet());
        },
      ),
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 35,
                      color: Colors.blueAccent,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "My Todo list",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Task to Complete : ${Provider.of<TaskProvider>(context).tasktocomplete} ",
                          style: TextStyle(fontSize: 20)),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: CircleBorder(),
                          elevation: 5,
                          shadowColor: Colors.blueGrey,
                          backgroundColor: Colors.blue[900],
                        ),
                        onPressed: () async {
                          var taskobject =
                              Provider.of<TaskProvider>(context, listen: false);
                          if (taskobject.Totaltask ==
                              taskobject.tasktocomplete) {
                            final snackBar = SnackBar(
                              content:
                                  const Text('Nothing Checked to Delete!!'),
                              duration: Duration(seconds: 1),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (await showalert(context) == 'OK') {
                            taskobject.deletetask();
                          }
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: MakeList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
