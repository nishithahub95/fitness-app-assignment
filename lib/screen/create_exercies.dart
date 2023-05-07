import 'package:flutter/material.dart';

class CreateExercise extends StatefulWidget {
  const CreateExercise({Key? key}) : super(key: key);

  @override
  State<CreateExercise> createState() => _CreateExerciseState();
}

class _CreateExerciseState extends State<CreateExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/exercises.jpg')
          )
        ),
      ),
    );
  }
}
