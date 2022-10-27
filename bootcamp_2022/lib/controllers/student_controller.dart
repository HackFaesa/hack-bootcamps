import 'dart:math';

import '../models/student_list_model.dart';
import '../models/student_model.dart';

class StudentController {
  void createStudent(String name, String course, StudentListModel model) {
    StudentModel newStudent = StudentModel.create(name: name, course: course);
    model.addStudent = newStudent;
  }

  StudentModel getRandomStudent(StudentListModel model) {
    List<StudentModel> notWinnersList = model.lst.where((student) => !student.isWinner).toList();

    int maxNumber = notWinnersList.length;
    int index = Random().nextInt(maxNumber);

    StudentModel studentChoosed = notWinnersList[index];
    StudentModel studentWinner = StudentModel.updateAsWinner(studentChoosed);

    model.removeStudent = studentChoosed;
    model.addStudent = studentWinner;

    return studentWinner;
  }

  bool isButtonVisible(StudentListModel model) {
    bool hasList = model.lst.isNotEmpty;
    bool isAllWinners = model.lst.every((student) => student.isWinner);
    return hasList && !isAllWinners;
  }
}
