import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';


class Counter_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create : (BuildContext context ) => CounterCubit(),
      child: BlocConsumer<CounterCubit , CounterStates >(
        listener: (context , state){

        },
        builder: (context , state) {
          return Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    CounterCubit.get(context).plus();
                  }, child: Text('add')),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(onPressed: (){
                    CounterCubit.get(context).minus();
                  }, child: Text('minus')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
