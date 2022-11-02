import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
class LoginScreen extends StatefulWidget {

  static String id= "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  bool showerror=false;
  bool showSpinner=false;
  late String error;
  late String email;
  late String password;
  final _auth=FirebaseAuth.instance;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,

    );
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag:'logo',
                child: Container(
                  height: 200.0,
                  child: Image.network('https://play-lh.googleusercontent.com/AlivnZogwxy4Ut47btedPt1GsuDZKKhojFto9FcldK5L5hHIIygbTFu1iOQPNLcp4-s'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                  //Do something with the user input.
                },
                style: TextStyle(color: Colors.cyan[900]),
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.email) ,
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.cyan[800]),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.cyan.shade900, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.cyan.shade900, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                onChanged: (value) {
                  password=value;
                  //Do something with the user input.
                },
                style: TextStyle(color: Colors.cyan[900]),
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.key) ,
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.cyan[800]),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.cyan.shade900, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.cyan.shade900, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Hero(
                  tag: 'icon2',
                  child: Material(
                    color: Colors.cyan[900],
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async{
                        try{
                          setState(() {
                            showSpinner=true;
                          });
                           final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if(user != null) {

                            Navigator.pushNamed(context,'dash_screen');
                          }
                          setState(() {
                            showSpinner=false;
                          });
                        }
                        catch(e){
                          setState(() {
                            showSpinner=false;
                            showerror=true;
                            error="Invalid Username or Password";
                          });
                          print(e);
                        }
                        //Implement login functionality.
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
              if(showerror==true)
                Center(
                  child: Text(error,style:TextStyle(
                    color: Colors.red,
                  )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

