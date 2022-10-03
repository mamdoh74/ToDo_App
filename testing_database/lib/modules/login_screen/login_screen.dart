
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_database/shared/components/components.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool ispassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            key: formkey,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: ( value) {
                  print(value);
                },
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'the email must not be empty';}
                  return null;
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
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !ispassword,
                onFieldSubmitted: (value) {
                  print(value);
                },
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'the password must not be empty';}
                  return null;
                },

                decoration: InputDecoration(

                    labelText: 'password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon :ispassword ?Icon(Icons.remove_red_eye): Icon(Icons.visibility_off_outlined),
                      onPressed: (){
                        setState(() {
                          ispassword = !ispassword;
                        });
                      },
                    )),
              ),
              SizedBox(
                height: 30.0,
              ),
              LoginButton(function:() {
                if(formkey.currentState!.validate())
                  {
                    print(emailController.text);
                    print(passwordController.text);
                  }

              },
                  text: 'Login',

              ),
              SizedBox(
                height: 30.0,
              ),

              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don\'t have an account',
                  ),
                  TextButton(onPressed: () {}, child: Text('Register Now')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
