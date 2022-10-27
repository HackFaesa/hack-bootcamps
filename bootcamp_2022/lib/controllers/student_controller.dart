
import 'dart:math';

import 'package:flutter/widgets.dart';

import '../models/student_model.dart';


class StudentController extends ChangeNotifier {
  List<StudentModel> _studentsList = [];

  List<StudentModel> get studentsList => _studentsList;

  set newStudentList(List<StudentModel> list) {
    _studentsList = list;
    notifyListeners();
  }

  set addStudent(StudentModel student) {
    _studentsList.add(student);
    notifyListeners();
  }

  set removeStudent(StudentModel student) {
    _studentsList.removeWhere((value) => student.id == value.id);
    notifyListeners();
  }

  void createStudent(String name, String course) {
    StudentModel newStudent = StudentModel.create(name: name, course: course);
    addStudent = newStudent;
  }

  StudentModel getRandomStudent() {
    List<StudentModel> notWinnersList = studentsList.where((student) => !student.isWinner).toList();

    int maxNumber = notWinnersList.length;
    int index = Random().nextInt(maxNumber);

    StudentModel studentChoosed = notWinnersList[index];
    StudentModel studentWinner = StudentModel.updateAsWinner(studentChoosed);

    removeStudent = studentChoosed;
    addStudent = studentWinner;

    return studentWinner;
  }

  bool isButtonVisible() {
    bool hasList = _studentsList.isNotEmpty;
    bool isAllWinners = _studentsList.every((student) => student.isWinner);
    return hasList && !isAllWinners;
  }
}
