

import 'NavBar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class chart extends StatefulWidget {

  chart({Key? key}) : super(key: key);

  @override
  State<chart> createState() => _chartState();
}

class _chartState extends State<chart> {
  late String name;
  late String phone;
  @override
  Widget build(BuildContext context) {
    var box3=Hive.box('Box3');
    return Scaffold(

      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.white,
      drawer:NavDrawer(),
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.cyan,
        title: const Text("Habit Tracker",style: TextStyle(
          fontFamily: 'PoorStory',
          fontWeight: FontWeight.w900,
        ),),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20.0,
              child: ClipOval(child:Image.network('https://raw.githubusercontent.com/Shivyoddha/mi_card_flutter/master/anishimage.png'))),
        ],
      ),
      body:
      SingleChildScrollView(
        child: Center(
          child: Column(
            children:<Widget> [
              SizedBox(
                height: 30.0,
              ),
              Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.cyan,
              child: SizedBox(
                width: 2500,
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.cyan[900],
                        radius: 90,
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://raw.githubusercontent.com/Shivyoddha/mi_card_flutter/master/anishimage.png"), //NetworkImage
                          radius: 80,
                        ),
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      //
                      SizedBox(
                        height: 20.0,
                        width: 110,
                      ),
                      Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ),textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          name=value;
                          box3.put('Profile',name);
                          //Do something with the user input.
                        },
                        style: TextStyle(color: Colors.cyan[900]),
                        decoration: InputDecoration(
                          fillColor: Colors.cyan.shade200,
                          filled: true,
                          prefixIcon:Icon(Icons.person) ,
                          hintText: 'Enter your username',
                          hintStyle: TextStyle(color: Colors.cyan[900]),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.cyan.shade800, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.cyan.shade800, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      //
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Phone no',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ),textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          phone=value;
                          //Do something with the user input.
                        },
                        style: TextStyle(color: Colors.cyan[900]),
                        decoration: InputDecoration(
                          fillColor: Colors.cyan.shade200,
                          filled: true,
                          prefixIcon:Icon(Icons.phone) ,
                          hintText: 'Enter your phone no',
                          hintStyle: TextStyle(color: Colors.cyan[900]),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.cyan.shade800, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.cyan.shade800, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        width: 110,
                        child: ElevatedButton(
                          onPressed: (){

                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.cyan[900])),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: const [
                                Icon(Icons.touch_app),
                                Text('Submit')
                              ],
                            ),
                          ),
                        ),
                        // ), //RaisedButton
                      ) //SizedBox
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),
          ]
          ),
        ),
      ),


    );
  }
  }


