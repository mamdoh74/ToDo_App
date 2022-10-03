import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Cubit/cubit.dart';


List<Map> tasks=[];
List<Map> newtasks=[];
List<Map> donetasks=[];
List<Map> archivedtasks=[];

Widget LoginButton({
  Color color = Colors.lightBlue,
  double width = double.infinity,
  required VoidCallback function,
  required String text,
})=> Container(
  width: width,
  color: color,
  height: 40.0,

  child: MaterialButton(
    onPressed: function,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
/*
Widget DefaultTextFromField ({
  required TextEditingController controller,
  required TextInputType type,
  required VoidCallback onsubmit,
  required VoidCallback validator,
  required String label,



}) => TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onsubmit,
  validator: validator,
  decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      prefixIcon: Icon(
        Icons.email,
      ),
      suffixIcon: Icon(
        Icons.email,
      )),
);

Widget DefaultTextFromField({

})=> TextFormField(
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  onFieldSubmitted: (value) {
    print(value);
  },
  decoration: InputDecoration(
      labelText: 'Email address',
      border: OutlineInputBorder(),
      prefixIcon: Icon(
        Icons.email,
      ),
      suffixIcon: Icon(
        Icons.email,
      )),
);
*/

Widget Tasks_Item(Map model,context) => Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(

    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),

    child: Row(

      children: [

        CircleAvatar(

          radius: 35.0,

          child: Text(

              '${model['time']}'

          ),

        ),

        SizedBox(width: 20,),

        //Spacer(),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              Text(

                '${model['title']}',

                style: TextStyle(

                    fontWeight: FontWeight.bold,

                    fontSize: 18.0

                ),

              ),

              Text(

                '${model['date']}',

                style: TextStyle(

                  color: Colors.grey,

                ),

              ),

            ],

          ),

        ),

        SizedBox(width: 20,),

        IconButton(

            onPressed: (){

              AppCubit.get(context).UpdateDataInDatabase(status: 'done', id: model['id']);

            },

            icon: Icon(Icons.check_box_rounded),

          color: Colors.green,

        ),



        IconButton(

            onPressed: (){

              AppCubit.get(context).UpdateDataInDatabase(status: 'archived', id: model['id']);



            },

            icon: Icon(Icons.archive),

          color: Colors.grey,

        ),

      ],

    ),

  ),
  onDismissed: (direction) {
    AppCubit.get(context).DeleteDataInDatabase(id: model['id']);
  },
);

Widget sperator_Item() =>Container(
  height: 1.0,
  width: double.infinity,
  decoration: BoxDecoration(
      color: Colors.grey[300],
  ),
);
/*
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required Function validate,
  required IconData prefix,
  IconData? suffix,
  Function? Suffixpressed,

})=> TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator: validate,
  decoration: InputDecoration(
    prefixIcon: prefix,
    suffixIcon: =suffix,

  ),
);
*/
