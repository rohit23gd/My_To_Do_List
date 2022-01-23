// ignore: file_names
// ignore_for_file: unused_import, file_names

import 'package:flutter/cupertino.dart';
import 'package:mytodo/Models/task.dart';
import 'package:provider/provider.dart';
// ignore: camel_case_types
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider extends ChangeNotifier {
  List<task> _Mylist = [];
  List<String> Data = [];
  int count = 0;

  void addnewtask(String new_task) {
    _Mylist.add(task(text: new_task));
    count++;
    notifyListeners();
    Data.add(new_task);
    Data.add(_Mylist.last.isDone.toString());
    updateTostorage(Data);
  }

  void toogleisDone(int ind) {
    _Mylist[ind].toogleisDone();
    if (_Mylist[ind].isDone == 1) {
      count--;
    } else
      count++;

    notifyListeners();
    Data[ind + 1] = _Mylist[ind].isDone.toString();
    updateTostorage(Data);
  }

  void setdata() async {
    SharedPreferences tasklist = await SharedPreferences.getInstance();
    Data = tasklist.getStringList('MyTask') ?? [''];
    if (Data.length % 2 == 1) Data.clear();
    for (int i = 0; i < Data.length; i++) {
      var temp = task(text: Data[i], isDone: Data[i + 1] == '1' ? 1 : 0);
      if (temp.isDone == 0) count++;
      _Mylist.add(temp);
      i++;
    }
    notifyListeners();
  }

  void deletetask() async {
    _Mylist.removeWhere((element) => element.isDone == 1);

    count = 0;
    List<String> temp = [];
    for (int i = 0; i < _Mylist.length; i++) {
      temp.add(_Mylist[i].text);
      temp.add(_Mylist[i].isDone.toString());
      if (_Mylist[i].isDone == 0) count++;
    }
    notifyListeners();
    Data = temp;
    updateTostorage(Data);
  }

  void updateTostorage(List<String> dataToupdate) async {
    SharedPreferences tasklist = await SharedPreferences.getInstance();
    tasklist.setStringList('MyTask', dataToupdate);
  }

  int get Totaltask {
    return _Mylist.length;
  }

  int get tasktocomplete {
    return count;
  }

  List<task> get getMyList {
    return _Mylist;
  }
}
