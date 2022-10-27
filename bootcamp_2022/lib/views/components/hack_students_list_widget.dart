import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/student_controller.dart';
import '../../main.dart';
import '../../models/student_model.dart';

class HackStudentsListWidget extends StatelessWidget {
  const HackStudentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentController>(builder: (context, controller, child) {
      var lst = controller.studentsList;

      if (lst.isEmpty) {
        return Center(
          child: Text('No Students', style: AppTheme.styleTitle2),
        );
      }

      return ListView.builder(
        itemCount: lst.length,
        itemBuilder: (BuildContext context, int index) {
          StudentModel student = lst[index];
          return Card(
            color: AppTheme.white,
            elevation: 5.0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: student.isWinner
                  ? CircleAvatar(
                      radius: 30,
                      backgroundColor: AppTheme.green,
                      child: const Icon(Icons.card_giftcard),
                    )
                  : CircleAvatar(
                      radius: 30,
                      backgroundColor: AppTheme.secondary,
                      backgroundImage: NetworkImage(student.image),
                    ),
              title: Text(student.name, style: AppTheme.styleTitle1),
              subtitle: Text(student.course, style: AppTheme.styleSubTitle1),
            ),
          );
        },
      );
    });
  }
}
