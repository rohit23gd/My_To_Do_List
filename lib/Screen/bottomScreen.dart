// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mytodo/Models/TaskProvider.dart';
//import 'package:mytodo/Models/task.dart';
import 'package:provider/provider.dart';

class Bottom_adder_sheet extends StatefulWidget {
  //const Bottom_adder_sheet({Key? key}) : super(key: key);
  @override
  State<Bottom_adder_sheet> createState() => _Bottom_adder_sheetState();
}

class _Bottom_adder_sheetState extends State<Bottom_adder_sheet> {
  String New_task = "";
  bool _validate = true;
  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Add Your New Task",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 10, //MediaQuery.of(context).viewInsets.bottom,
                  left: 20,
                  right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Task ...",
                  // labelText: 'Enter Your task Here',
                  errorText: _validate ? null : 'Task Can\'t Be Empty',
                  //errorBorder:
                ),
                controller: textcontroller,
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    _validate = true;
                  });

                  New_task = value;
                  //print(task);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                  top: 10),
              child: TextButton(
                  style: TextButton.styleFrom(
                      elevation: 10, backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    if (New_task == "" || New_task == " ") {
                      setState(() {
                        _validate = false;
                      });
                    } else {
                      Provider.of<TaskProvider>(context, listen: false)
                          .addnewtask(New_task);
                      textcontroller.clear();

                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   content: Text('Snackbar message'),
                      //   behavior: SnackBarBehavior.floating,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(24),
                      //   ),
                      //   margin: EdgeInsets.only(
                      //       bottom: MediaQuery.of(context).size.height - 200,
                      //       right: 20,
                      //       left: 20),
                      // ));
                    }
                  },
                  child: const Text("ADD",
                      style: TextStyle(fontSize: 30, color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
