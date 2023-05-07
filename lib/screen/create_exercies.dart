import 'package:fitness_app/constans/color_file.dart';
import 'package:fitness_app/model/exercise.dart';
import 'package:fitness_app/screen/components/gradiant_button.dart';
import 'package:flutter/material.dart';

class CreateExercise extends StatefulWidget {

  final Function(Exercise) addExercise;


  CreateExercise(this.addExercise);

  @override
  State<CreateExercise> createState() => _CreateExerciseState();
}

class _CreateExerciseState extends State<CreateExercise> {

  TextEditingController exerciseController = TextEditingController();
  TextEditingController setsController = TextEditingController();
  TextEditingController repsController = TextEditingController();
  List<Exercise> exercisList=[];
 var isLoading=true;
  @override
  Widget build(BuildContext context) {
    Widget buildTextFormField(String label, TextEditingController controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: headColor),
                        borderRadius: BorderRadius.circular(30)),
                    label: Text(label))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      );
    }
    return  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/exercises.jpg')
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton(
                hint: Text('Exercises....'),
                items: exercisList.map((e){
              return DropdownMenuItem(
                value: e.sets.toString(),
                  child: Text(e.ename));
            }).toList(), onChanged: (_){}),

             Text(
              'Create Exercises',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: headColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            buildTextFormField('Exercise', exerciseController),
            buildTextFormField('Sets', setsController),
            buildTextFormField('Reps',repsController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            InkWell(
                onTap: () {
                  final exercs = Exercise(
                      exerciseController.text,
                      setsController.text,
                      repsController.text,
                      );
                  widget.addExercise(exercs);
                  Navigator.of(context).pop();
                },
                child: GradiantButton('submit')
            ),

          ],
        ),

    );
  }
}
