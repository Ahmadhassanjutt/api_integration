import 'package:course_api/view/create_job_screen.dart';
import 'package:course_api/view/login_screen.dart';
import 'package:course_api/view/screen_withList_model.dart';
import 'package:course_api/view/screen_with_model.dart';
import 'package:course_api/view/screen_with_multiple_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CreateJobScreen(),
    );
  }
}


