import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/Cubit/States.dart';
import '../../shared/Cubit/cubit.dart';
import '../../shared/components/components.dart';

class archivedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer< AppCubit ,AppStates>(
      listener: (context , state){},
      builder: (context , state){
        return ListView.separated(
          itemBuilder: (context , index ) => Tasks_Item(archivedtasks[index],context),
          separatorBuilder: (context , index ) => sperator_Item(),
          itemCount: archivedtasks.length,
        );
      },

    );
  }
}
