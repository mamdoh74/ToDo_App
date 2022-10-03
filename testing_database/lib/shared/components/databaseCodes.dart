import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import 'components.dart';


late Database database;

void createDatabase() async
{
   database = await openDatabase(
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
        getDataFromDataBase(database).then((value) {
        tasks=value ;
        //print(tasks);
         });
        print('database opened');

      }
  );

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

    } ).catchError((error){
      print('Error in inserting a new raw $error');

    });
    return Future(() => null);

  });

}

Future<List<Map>> getDataFromDataBase(database) async{
  return await database.rawQuery('select * from tasks');

}
