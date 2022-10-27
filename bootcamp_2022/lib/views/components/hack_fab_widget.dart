import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/student_controller.dart';
import '../../main.dart';
import '../../models/student_model.dart';
import 'hack_create_student.dart';
import 'hack_winner_widget.dart';

class HackFabWidget extends StatelessWidget {
  const HackFabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentController>(builder: (context, controller, child) {
      const shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      );

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: controller.isButtonVisible(),
            child: FloatingActionButton(
              backgroundColor: AppTheme.secondary,
              child: Icon(Icons.card_giftcard, color: AppTheme.white),
              onPressed: () {
                StudentModel student = controller.getRandomStudent();
                showModalBottomSheet(
                  context: context,
                  shape: shape,
                  builder: (context) => HackWinnerWidget(student: student),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: AppTheme.secondary,
            child: Icon(Icons.person_add, color: AppTheme.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: shape,
                builder: (context) => const HackCreateStudent(),
              );
            },
          ),
        ],
      );
    });
  }
}
