import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/student_controller.dart';
import 'views/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentController()),
      ],
      child: MaterialApp(
        title: 'Bootcamp 2022 Project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto'),
        home: const HomeView(),
      ),
    );
  }
}

class AppTheme {
  static Color primary = const Color(0xFF1C3864);
  static Color secondary = const Color(0xFFDE7744);
  static Color white = const Color(0xFFFEFEFE);
  static Color green = const Color(0xFF22702F);

  static TextStyle styleTitle1 = TextStyle(
    color: primary,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );
  static TextStyle styleSubTitle1 = TextStyle(
    color: primary.withOpacity(.6),
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleTitle2 = styleTitle1.copyWith(color: secondary);
  static TextStyle styleSubTitle2 = styleSubTitle1.copyWith(color: secondary);
}
