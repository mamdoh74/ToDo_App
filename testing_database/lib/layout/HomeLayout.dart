import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_database/modules/archived/archived.dart';
import 'package:testing_database/modules/done/done.dart';
import 'package:testing_database/modules/tasks/tasks.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:testing_database/shared/Cubit/States.dart';
import 'package:testing_database/shared/Cubit/cubit.dart';
import 'package:testing_database/shared/components/databaseCodes.dart';

import '../shared/components/components.dart';
//import 'package:testing_01/shared/components/databaseCodes.dart';



class Homelayout extends StatelessWidget {

  @override


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit()..createDatabase() ,
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state) {

        },
        builder:(context , state) {
          AppCubit cub = AppCubit.get(context);
          return Scaffold(
          key: cub.scaffoldKey,

          appBar: AppBar(
            title: Text(
              cub.titles[cub.index],
            ),
          ),
          body: ConditionalBuilder(
            condition:state is! AppLoadingData ,//tasks.length > 0
            builder: (context) => cub.screens[cub.index],//when the condition is true
            fallback: (context ) => Center(child: CircularProgressIndicator()),//when the condition is false
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (!cub.isopened) {
                cub.ChangeFloatingIcon(Icon(Icons.edit));
                if (cub.scaffoldKey.currentState != null) {
                  // setState(() {
                  //   isopened = !isopened;
                  // });
                  cub.scaffoldKey.currentState!.showBottomSheet((context) => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cub.taskTextController,
                            decoration: InputDecoration(
                                labelText: 'Task Title',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.text_format)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            controller: cub.clockController,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                print(value?.format(context));
                                cub.clockController.text =
                                '${value?.format(context)}';
                              });
                            },
                            decoration: InputDecoration(
                                labelText: 'Task Time',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.watch_later)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            //keyboardType: TextInputType.text,
                            controller: cub.dateController,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-12-12'),
                              ).then((value) {
                                cub.dateController.text =
                                '${DateFormat.yMMMd().format(value!)}';
                                print('${DateFormat.yMMMd().format(value!)}');
                              });
                            },
                            decoration: InputDecoration(
                                labelText: 'date',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.date_range)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            onPressed: () {
                              cub.insertToDatabase(
                                title: cub.taskTextController.text,
                                date: cub.dateController.text,
                                time: cub.clockController.text,
                              ).then((value) {
                                Navigator.pop(context);
                              });
                            },
                            child: Text('add'),
                          )
                        ],
                      ),
                    ),
                  ))
                      .closed
                      .then((value) {
                    cub.ChangeFloatingIcon(Icon(Icons.add));
                    // setState(() {
                    //   isopened = false;
                    // });
                    //Navigator.pop(context);
                  });
                } else {
                  print('current state is null');
                  // setState(() {
                  //   isopened = !isopened;
                  // });
                }
              } else {
                // setState(() {
                //   isopened = !isopened;
                // });

                cub.floatingIcon = Icon(Icons.add);
                Navigator.pop(context);
              }
            },
            child: cub.floatingIcon,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              AppCubit.get(context).ChangeIndex(index);
            },
            currentIndex: AppCubit.get(context).index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                label: 'done',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive),
                label: 'archive',
              ),
            ],
          ),
        );
          },

      ),
    );
  }

  Future<String> getDataFromDataBase() async {
    return 'data from data base';
  }
}
