import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wel extends StatefulWidget {
  const Wel({Key? key}) : super(key: key);
  @override
  State<Wel> createState() => _WelState();
}
class _WelState extends State<Wel> {
  var nam;
  var unam;
  var ema;
  var mob;
  var pas;
  Future<dynamic>getData() async{
    SharedPreferences spname=await SharedPreferences.getInstance();
    nam = spname.getString('name');
    unam = spname.getString('uname');
    ema = spname.getString('email');
    mob = spname.getString('num');
    pas = spname.getString('pass');
    print(nam);
  }
  clear() async {
    SharedPreferences spname=await SharedPreferences.getInstance();
    spname.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Hom();
    },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),'WELCOME!'),
            )),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if(nam!='0'){
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                           // decoration: InputDecoration(labelText: nam),
                        initialValue: nam),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Username : $unam'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Email : $ema'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Mobile number : $mob'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Password : $pas'),
                      ),
                    ],
                  );
                }
                else{
                  return Text('no data');
                }
            },),
            Center(
              child: InkWell(onTap: (){
                clear();
              } ,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(child: Text(
                        style: TextStyle(
                            color: Colors.white),
                        'Log out')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
