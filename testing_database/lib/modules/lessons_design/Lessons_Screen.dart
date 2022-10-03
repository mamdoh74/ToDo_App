import 'package:flutter/material.dart';

class Lessons_screen extends StatefulWidget {
  const Lessons_screen({Key? key}) : super(key: key);

  @override
  State<Lessons_screen> createState() => _Lessons_screenState();
}

class _Lessons_screenState extends State<Lessons_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(bottom: 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 51, 102, 10),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
            ),

            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,)),
                    Spacer(),
                    MaterialButton(
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Spacer(flex: 1,),
                            Text('50'),
                            Spacer(flex: 2,),
                            Icon(
                              Icons.diamond,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                        onPressed: (){},

                    )
                  ],
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(end: 30,),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/teth.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                'المستوى  : 10',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                           // Spacer(),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'سمبوسه',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                  color: Colors.white,
                              ),
                            ),
                           // Spacer(),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'الطرقات الصعبه دائما ما تؤدى الى اماكن رائعه',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(flex: 2,),
                    Container(
                      width: 300,
                      padding: EdgeInsetsDirectional.only(start: 10,bottom:10,end: 30,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search_rounded),
                          Text(
                            'البحث عن المواد ..'
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 2,),
                  ],
                ),

              ],
            ),

          ),
          Row(
            children: [

            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'الاساسيه'),
          BottomNavigationBarItem(icon: Icon(Icons.wind_power),label: 'الجوائز'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'التقويم'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'البروفايل'),
        ],
      ),
    );
  }
}
