import 'package:fitness_app/constans/color_file.dart';
import 'package:flutter/material.dart';

class GradiantButton extends StatelessWidget {
  //const GradiantButton ({Key? key}) : super(key: key);
  final String title;
  const GradiantButton(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: gcolor,
          )),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
