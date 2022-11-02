import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dash_screen.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
class RegistrationScreen extends StatefulWidget{

  static String id= "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with SingleTickerProviderStateMixin{
  String name='c';

  bool showSpinner=false;
  late AnimationController controller;
  final _auth = FirebaseAuth.instance;
      late String email;
      late String password;
      late String error;
      late bool showerror =false;

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
                tag: 'logo',
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
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  name=value;
                  //Do something with the user input.
                },

                style: TextStyle(color: Colors.cyan[900]),
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.person),
                  hintText: 'Enter your Username',

                  hintStyle: TextStyle(color: Colors.cyan[800]),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan.shade900, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan.shade900, width: 2.0),
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
                    borderSide: BorderSide(color: Colors.cyan.shade900, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan.shade900, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
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
                    borderSide: BorderSide(color: Colors.cyan.shade900, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan.shade900, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Hero(
                  tag: 'icon1',
                  child: Material(
                    color: Colors.cyan[900],
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async{
                        try {
                          setState(() {
                            showSpinner=true;
                          });
                          final newUser = await _auth
                              .createUserWithEmailAndPassword(email: email,
                              password: password);
                          if(newUser!=null) {
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashScreen()));
                          }
                          setState(() {
                            showSpinner=false;
                          });
                        }
                        catch(e) {
                          setState(() {
                            error="Invalid User Name or Password!";
                            showerror=true;
                          });
                          print(e);
                          showSpinner=false;
                        }
                        print(email);
                        print(password);

                        //Implement registration functionality.
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
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


