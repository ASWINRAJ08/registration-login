import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/wel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Registration.dart';
import 'home.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  var fkey=GlobalKey<FormState>();
  TextEditingController usname=TextEditingController();
  TextEditingController passw=TextEditingController();
  var username;
  var password;
  Future<void> getData()async{
    SharedPreferences spname=await SharedPreferences.getInstance();
    username = spname.getString('uname');
    password = spname.getString('pass');
    print('uname : $username, password : $password');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: fkey,
            child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Hom();
                          },));
                        }, icon: Icon(Icons.arrow_back)),
                      ],
                    ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60,bottom: 10),
                        child: Text(style: TextStyle(
                          fontSize: 20,
                            fontWeight: FontWeight.bold),
                            'Welcome Back!'),
                      ),

                    Center(child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text('Log in to your account'),
                    )),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),'User Name'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: usname,
                        validator: (a){
                          if(a!=username){
                            return 'invalid username';
                          }
                        },
                        decoration: InputDecoration(
                        labelText: 'Enter your Username',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                        ),),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                              'Password'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: passw,
                        validator: (b){
                          if(b!=password){
                            return 'incorrect password';
                          }

                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: (){

                                },icon: Icon(Icons.remove_red_eye_outlined)),
                            labelText: 'Enter your Password',
                            border: OutlineInputBorder(borderRadius:  BorderRadius.circular(10))),),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:20),
                          child: InkWell(
                              onTap: () {

                              },child: Text(style: TextStyle(color: Colors.deepPurple),'forgot password')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(onTap: () async{
                       await getData();
                        if(fkey.currentState!.validate()) {
                        if (username == usname.text && password == passw.text) {
                          Fluttertoast.showToast(msg: 'success');
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Wel();
                            },
                          ));
                        }
                      }
                      },
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(child: Text(
                              style: TextStyle(
                                  color: Colors.white),
                              'Log In')),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                              Text('Dont have an accont?'),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Reg();
                              },));
                            },
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                    style: TextStyle(decoration: TextDecoration.underline,
                                        color: Colors.deepPurple),'Create account'),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
          ),
        ),
      ),

    );
  }
}
