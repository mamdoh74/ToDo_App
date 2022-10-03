import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_database/shared/Cubit/States.dart';

import '../../shared/Cubit/cubit.dart';
import '../../shared/components/components.dart';
class tasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer< AppCubit ,AppStates>(
      listener: (context , state){},
      builder: (context , state){
        return ConditionalBuilder(
          condition: tasks.length>0,
          builder: (context) => ListView.separated(
            itemBuilder: (context , index ) => Tasks_Item(newtasks[index],context),
            separatorBuilder: (context , index ) => sperator_Item(),
            itemCount: newtasks.length,
          ),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.list,color: Colors.blue,size: 100,),
                Text('No Tasks !! Please add Some',style: TextStyle(fontSize: 30),)
              ],
            ),
          ),
        );
      },

    );
  }


}
