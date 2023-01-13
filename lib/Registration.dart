import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  var fkey=GlobalKey<FormState>();
  TextEditingController name=TextEditingController();
  TextEditingController uname=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController num=TextEditingController();
  TextEditingController pass=TextEditingController();
  Future<void> saveData()async{
    SharedPreferences spname=await SharedPreferences.getInstance();
    spname.setString('name', name.text);
    spname.setString('uname', uname.text);
    spname.setString('email', email.text);
    spname.setString('num', num.text);
    spname.setString('pass', pass.text);
  }
  Future<void> getData()async{
    SharedPreferences spname=await SharedPreferences.getInstance();
    String? name=spname.getString('name');
    print(name);
    String? uname=spname.getString('uname');
    print(uname);
    String? email=spname.getString('email');
    print(email);
    String? num=spname.getString('num');
    print(num);
    String? pass=spname.getString('pass');
    print(pass);
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(style: TextStyle(
                      fontSize: 20,
                        fontWeight: FontWeight.bold),'Registration!'),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text( style: TextStyle(
                        fontSize: 15,
                          fontWeight: FontWeight.bold),'Name'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: name,
                    validator: (a){
                    if(a!.isEmpty){
                      return 'Enter Your Name';
                    }
                  },
                    decoration: InputDecoration(labelText: 'enter your name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text( style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold),'User Name'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: uname,
                    validator: (b){
                      if(b!.isEmpty){
                        return 'Enter Your User Name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'enter your User name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(style: TextStyle(fontWeight: FontWeight.bold),'Email'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (c){
                      if(c!.isEmpty) {
                        return 'Enter Your email';
                      }
                    },
                    controller: email,
                    decoration: InputDecoration(labelText: 'enter your email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(style: TextStyle(fontWeight: FontWeight.bold),'Mobile Number'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (d){
                      if(d!.isEmpty){
                        return 'Enter Your number';
                      }
                      if(d.length<10){
                        return 'enter a valid mobile number';
                      }
                    },
                    controller: num,
                    decoration: InputDecoration(labelText: 'enter your number',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(style: TextStyle(fontWeight: FontWeight.bold),'Password'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (e){
                      if(e!.isEmpty){
                        return 'Enter Your password';
                      }
                      if(e.length<6){
                        return 'password must be 6 characters';
                      }
                    },
                    controller: pass,
                    decoration: InputDecoration(labelText: 'enter new password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(style: TextStyle(fontWeight: FontWeight.bold),'Confirm Password'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (f){
                      if(f!=pass.text){
                        return 'password missmatch';
                      }
                      if(f!.isEmpty){
                        return 're-enter your password';
                      }
                    },
                    decoration: InputDecoration(labelText: 're-enter your password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(onTap: ()async{
                   await saveData();
                    getData();
                    if(fkey.currentState!.validate()){
                      Fluttertoast.showToast(msg: 'Success');
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Log();
                      },));
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
                          'Sign Up')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
