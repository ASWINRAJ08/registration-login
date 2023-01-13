import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Registration.dart';
import 'login.dart';

class Hom extends StatefulWidget {
  const Hom({Key? key}) : super(key: key);

  @override
  State<Hom> createState() => _HomState();
}

class _HomState extends State<Hom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: 20),'Welcome to Chat app'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Log();
                    },));
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
                  )
                  ),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Reg();
                  },));
                },
                  child: Container(
                        height: 40,
                        width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(50)),
                              child: Center(child: Text(
                                  style: TextStyle(color: Colors.deepPurple),
                                  'Create account'))),
                ),
              ],
            ),
          ) ),
    );
  }
}
