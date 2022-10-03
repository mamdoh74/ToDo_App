import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testing_database/shared/Cubit/States.dart';

import '../../modules/archived/archived.dart';
import '../../modules/done/done.dart';
import '../../modules/tasks/tasks.dart';
import '../components/components.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context )=> BlocProvider.of(context);

  int index = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isshow = false;
  var taskTextController = TextEditingController();
  var clockController = TextEditingController();
  var dateController = TextEditingController();
  bool isopened = false;
  Icon floatingIcon = Icon(Icons.add);
  List<Widget> screens = [
    tasksScreen(),
    doneScreen(),
    archivedScreen(),
  ];
  List<String> titles = [
    'Tasks',
    'Done',
    'archived',
  ];

  void ChangeIndex(int index)
  {
    this.index=index;
    emit(AppChangeBottomNavBarState());
  }


  late Database database;

  void createDatabase() async
  {
        openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database , version)
        {
          print('database created');
          database.execute('create table tasks(id integer primary key,title TEXT , date TEXT , '
              'time TEXT , status TEXT)').then((value) {
            print('the sql query is executed') ;
          }).catchError((error)
          {
            print(error);
          });

        },
        onOpen: (database)
        {
          getDataFromDataBase(database);
          print('database opened');

        }
    ).then((value) {
      database=value;
      emit(AppCreateDataBase());
    });

  }

  late Database database2;
  void create_database2() async
  {
    // the above database2 variable will full when the open database mehtod done all but the second database2 variable
    // will full in on create or in open method that mean that the second var will full then the first var full
    database2 = await openDatabase(
        'todo2.db',
      version: 1,
      onCreate:(database2,version) {
          print('the database created');
          database2.execute(
              'create table tasks(id integer primary key,title text,date text,time text, status text)'
          ).then((value) {
            print('the database created without any error');
          }).catchError((error) {
            print(' there is an error in creating the database ');
          }
              );

      } ,
      onOpen: (database2){
        print('the database opened');
      },

    );
  }

  Future insert_into_database2() async{
    return await database2.transaction((txn) {
      txn.rawInsert('insert into tasks(title,date,time,status) values("going to the gym","12-7-2022","05:00 pm","lesa")');
      return Future(() => null);
    }).then((value) {}).catchError((error){print(error);});

  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String time,
    String status='None',
  }) async
  {
    return await database.transaction((txn) {
      txn.rawInsert(
          'insert into tasks(title , date, time , status) values ("$title","$date","$time", "$status")').then((value){
        print('$value iserted sucessfuly');
        emit(AppInsesrtDataBase());
        getDataFromDataBase(database);
      } ).catchError((error){
        print('Error in inserting a new raw $error');

      });
      return Future(() => null);

    }).then((value) {

    });

  }

  void getDataFromDataBase(database) async{
    newtasks=[];
    donetasks=[];
    archivedtasks=[];
    emit(AppLoadingData());
    database.rawQuery('select * from tasks ').then((value) {
      tasks=value ;
      emit(AppGetDataBase());
      tasks.forEach((element) {
        if (element['status']=='None')
          newtasks.add(element);
        else if(element['status']=='done')
          donetasks.add(element);
        else archivedtasks.add(element);
      });

    });

  }


  Future<List<Map>> getDataFromDataBase2(database2) async{
    return await database2.rawQuery('select * from tasks');
  }

  UpdateDataInDatabase({
   required String status, required int id,
}) async {
    return database.rawUpdate(
        'update tasks set status = "$status" where id = $id',
    ).then((value) {
      getDataFromDataBase(database);
      emit(AppUpdateDataBase());
    });
  }

  DeleteDataInDatabase({
    required int id,
  }) async {
    return database.rawUpdate(
      'Delete from tasks where id = $id',
    ).then((value) {
      getDataFromDataBase(database);
      emit(AppDeleteDataBase());
    });
  }

  void ChangeFloatingIcon(Icon icon)
  {
    floatingIcon=icon;
    emit(AppChangeFloatingIcon());
  }


}