import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:fitness_app/constans/color_file.dart';
import 'package:fitness_app/model/exercise.dart';
import 'package:fitness_app/model/program.dart';
import 'package:fitness_app/screen/components/action_button.dart';
import 'package:fitness_app/screen/create_exercies.dart';
import 'package:fitness_app/screen/create_program.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Program> programList = [];
  List<Exercise> exercisList=[];
  @override
  Widget build(BuildContext context) {
    void addNewProgram(Program program) {
      setState(() {
        programList.add(program);
      });
    }
    void addNewExercise(Exercise exercise) {
      setState(() {
        exercisList.add(exercise);
      });
    }

    void showProgramForm() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: CreateProgram(addNewProgram),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            );
          });
    }
    void editProgramForm(int index) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: CreateProgram((p0) => null),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            );
          });
    }


    void showexerciseForm() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: CreateExercise(addNewExercise),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            );
          });
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
                gradient: LinearGradient(colors:gcolor)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_sharp,
                      color: Colors.white,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('images/profilem.jpg'),
                    ),
                    Badge(
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                      badgeContent: const Text(
                        '2',
                        style: TextStyle(fontSize: 7),
                      ),
                      //badgeStyle: BadgeStyle(),
                      position: BadgePosition.topEnd(top: -3, end: -1),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Positioned(
              top: 40,
              left: 100,
              child: Center(
                child: Text(
                  'MAKE \nFITNESS \n YOUR FAVOURITE HABIT...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )),
          Positioned(
            top: 120,
            left: 40,
            child: InkWell(
              onTap: () {
                showProgramForm();
              },
              child: const ActionButton(
                theWidth: 160.0,
                theHeight: 50.0,
                theChild: Text(
                  'Create Programs',
                  style: TextStyle(color: Colors.white54, fontSize: 18.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 230,
            child: InkWell(
              onTap: () {
                showexerciseForm();
              },
              child: const ActionButton(
                theWidth: 160.0,
                theHeight: 50.0,
                theChild: Text(
                  'Create Exercise',
                  style: TextStyle(color: Colors.white54, fontSize: 18.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.73,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/fitness.jpg'))),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.73,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(50)),
                    color: Colors.white.withOpacity(0.6)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Programs....',style: TextStyle(color:headColor,fontSize: 20,fontWeight: FontWeight.w700 ),),
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                            itemCount: programList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                       mainAxisAlignment: MainAxisAlignment.start ,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,

                                        children: [
                                          Text(programList[index].goal.toString(),style: TextStyle(fontSize: 18,color: headColor),),
                                          SizedBox(height: 3,),
                                          Text(programList[index].level.toString(),style: TextStyle(fontSize: 15,color: iconColor),),
                                          SizedBox(height: 3,),
                                          Text(programList[index].type.toString(),style: TextStyle(fontSize: 15,color: iconColor),),
                                          SizedBox(height: 3,),
                                          Text(programList[index].time.toString(),style: TextStyle(fontSize: 15,color: iconColor),),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                         InkWell(
                                             onTap: (){
                                               editProgramForm(index);

                                             },
                                             child: Icon(Icons.edit,color: iconColor,)) ,
                                          InkWell(
                                              onTap: (){
                                                setState(() {
                                                  programList.removeAt(index);
                                                });

                                              },
                                              child: Icon(Icons.delete,color: iconColor,)) ,
                                          Icon(Icons.expand_circle_down_outlined,color: iconColor,) ,

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      //Text('Programs....',style: TextStyle(color:headColor,fontSize: 20,fontWeight: FontWeight.w700 ),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Positioned(top: 220,
          // child: Text('Hello'),)
        ],
      ),
    );
  }
}
