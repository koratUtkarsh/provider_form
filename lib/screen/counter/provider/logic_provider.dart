import 'package:flutter/material.dart';
import 'package:provider_form/screen/counter/model/Modal.dart';

class liProvider extends ChangeNotifier
{
  late List<modaldata> dataof = [];
  void adddata(modaldata m1)
  {
    dataof.add(m1);
    notifyListeners();
  }
  void delet(int index)
  {
    dataof.removeAt(index);
    notifyListeners();
  }
  void update(int index,modaldata m1)
  {
    dataof[index]=m1;
    notifyListeners();
  }
}