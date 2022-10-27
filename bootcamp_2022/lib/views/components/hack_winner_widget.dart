import 'package:flutter/material.dart';

import '../../main.dart';
import '../../models/student_model.dart';

class HackWinnerWidget extends StatelessWidget {
  final StudentModel student;
  const HackWinnerWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircleAvatar(
            backgroundColor: AppTheme.secondary,
            backgroundImage: NetworkImage(student.image),
            radius: 70,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(student.name, style: AppTheme.styleTitle1),
              const SizedBox(height: 5),
              Text(student.course, style: AppTheme.styleSubTitle1)
            ],
          ),
        ),
      ],
    );
  }
}
