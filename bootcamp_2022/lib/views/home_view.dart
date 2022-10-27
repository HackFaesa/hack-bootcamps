import 'package:flutter/material.dart';
import '../main.dart';
import 'components/hack_fab_widget.dart';
import 'components/hack_students_list_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: AppTheme.white,
            child: Center(
              child: Image.network(
                'https://avatars.githubusercontent.com/u/109104895?s=200&v=4',
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: HackStudentsListWidget(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const HackFabWidget(),
    );
  }
}
