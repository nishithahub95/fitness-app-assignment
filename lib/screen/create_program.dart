import 'package:fitness_app/constans/color_file.dart';
import 'package:fitness_app/model/program.dart';
import 'package:fitness_app/screen/components/gradiant_button.dart';
import 'package:flutter/material.dart';

class CreateProgram extends StatefulWidget {
  final Function(Program) addProgram;

  CreateProgram(this.addProgram);

  @override
  State<CreateProgram> createState() => _CreateProgramState();
}

class _CreateProgramState extends State<CreateProgram> {
  TextEditingController goalController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget buildTextFormField(String label, TextEditingController controller) {
      return Column(
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
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/fit.jpg'))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create you Program',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000046)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              buildTextFormField('Main Goal', goalController),
              buildTextFormField('Workout Type', typeController),
              buildTextFormField('Training Level', levelController),
              buildTextFormField('Program Duration', durationController),
              buildTextFormField('Days Per Week', daysController),
              buildTextFormField('Time Per Workout', timeController),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              InkWell(
                onTap: () {
                  final program = Program(
                      goalController.text,
                      typeController.text,
                      levelController.text,
                      durationController.text,
                      daysController.text,
                      timeController.text);
                  widget.addProgram(program);
                  Navigator.of(context).pop();
                },
                child: GradiantButton('submit')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
