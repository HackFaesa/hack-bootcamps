import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controllers/student_controller.dart';
import '../../main.dart';
import '../../models/student_list_model.dart';

class HackCreateStudent extends StatefulWidget {
  const HackCreateStudent({super.key});

  @override
  State<HackCreateStudent> createState() => _HackCreateStudentState();
}

class _HackCreateStudentState extends State<HackCreateStudent> {
  String newStudentName = '';
  String newStudentCourse = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextField(
              style: AppTheme.styleSubTitle2,
              decoration: InputDecoration(
                labelText: 'Student Name',
                labelStyle: AppTheme.styleSubTitle1,
                hintText: 'Type your fullname',
                hintStyle: AppTheme.styleSubTitle1,
              ),
              onChanged: (value) {
                setState(() => newStudentName = value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextField(
              style: AppTheme.styleSubTitle2,
              decoration: InputDecoration(
                labelText: 'Course Name',
                labelStyle: AppTheme.styleSubTitle1,
                hintText: 'Type your course',
                hintStyle: AppTheme.styleSubTitle1,
              ),
              onChanged: (value) {
                setState(() => newStudentCourse = value);
              },
            ),
          ),
          Consumer<StudentListModel>(builder: (context, model, child) {
            return ElevatedButton(
              onPressed: () {
                if (newStudentName.isNotEmpty && newStudentCourse.isNotEmpty) {
                  var controller = StudentController();

                  controller.createStudent(newStudentName, newStudentCourse, model);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: AppTheme.secondary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: Text('Add Student', style: AppTheme.styleSubTitle1.copyWith(color: AppTheme.white)),
            );
          }),
        ],
      ),
    );
  }
}
