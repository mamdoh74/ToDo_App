
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text(
          'first app',
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                printAnyThing();
              }),
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 0.0,
        ),
        width: 300.0,
        height: 300.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(40.0),
                ),
              ),
              clipBehavior: Clip
                  .antiAliasWithSaveLayer, //for applaying clipping on the stack
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://thumbs.dreamstime.com/b/aster-flowers-art-design-26968847.jpg'),
                    width: 300.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.red.withOpacity(0.7),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: Text(
                      'First',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.amberAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void printAnyThing() {
    print('flutter');
  }
}
