import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/chart.dart';

import 'dash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class WelcomeScreen extends StatefulWidget {


  static String id= "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = CurvedAnimation(parent:controller, curve: Curves.bounceOut);
    controller.forward();
    animation.addStatusListener((status) {print(animation.value);});

    controller.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                     child: Image.network('https://play-lh.googleusercontent.com/AlivnZogwxy4Ut47btedPt1GsuDZKKhojFto9FcldK5L5hHIIygbTFu1iOQPNLcp4-s'),
                    height: (60.0)*animation.value,
                  ),
                ),
                Text(
                  'Habit Tracker',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Hero(
                tag: 'icon2',
                child: Material(
                  elevation: 5.0,
                  color: Colors.cyan[300],
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context,"login_screen");
                      //Go to login screen.
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Hero(
                tag: 'icon1',
                child: Material(
                  color: Colors.cyan[900],
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context,"registration_screen");
                      });
                      //Go to registration screen.
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                    ),
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
