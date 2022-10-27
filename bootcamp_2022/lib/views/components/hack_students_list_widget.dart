import '../../models/student_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/student_model.dart';

class HackStudentsListWidget extends StatelessWidget {
  const HackStudentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentListModel>(builder: (context, model, child) {
      if (model.lst.isEmpty) {
        return Center(
          child: Text('No Students', style: AppTheme.styleTitle2),
        );
      }

      return ListView.builder(
        itemCount: model.lst.length,
        itemBuilder: (BuildContext context, int index) {
          StudentModel student = model.lst[index];
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
