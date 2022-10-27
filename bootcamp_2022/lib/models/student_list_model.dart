import 'package:flutter/material.dart';

import 'student_model.dart';

class StudentListModel extends ChangeNotifier {
  List<StudentModel> _lst = [];

  List<StudentModel> get lst => _lst;

  set newStudentList(List<StudentModel> list) {
    _lst = list;
    notifyListeners();
  }

  set addStudent(StudentModel student) {
    _lst.add(student);
    notifyListeners();
  }

  set removeStudent(StudentModel student) {
    _lst.removeWhere((value) => student.id == value.id);
    notifyListeners();
  }
}
