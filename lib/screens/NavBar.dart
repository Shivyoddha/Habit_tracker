import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habit_tracker_app/screens/habit.dart';
import 'package:habit_tracker_app/screens/profile.dart';
import 'registration_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
class NavDrawer extends StatelessWidget {
  late String user;
  late String name;
  late String phone;
  String me='Anish';
  final _auth = FirebaseAuth.instance;
  var box1= Hive.box<Habit>('Box1');
  var box2= Hive.box<Profile>('Box2');
  var box3= Hive.box('Box3');

  @override
  Widget build(BuildContext context) {
    String? backup;
    final boxPath = box1.path;
    me = box3.get('Profile');
    if(me==null)
      me='Anish';
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          DrawerHeader(
            child: Text(
              'Hi '+ me,
              style: TextStyle(color: Colors.white, fontSize: 35, fontWeight:FontWeight.w900 ),textAlign: TextAlign.start,
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                  image: NetworkImage('https://raw.githubusercontent.com/Shivyoddha/mi_card_flutter/master/anishimage.png'),)),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home'),
            onTap: () => {
              Navigator.pushNamed(context, 'dash_screen'),
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.pushNamed(context, 'chart')},
          ),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text('BackUp'),
            onTap: () => {
              showDialog(context: context, builder: (content)=>AlertDialog(
                backgroundColor: Colors.white,
                title: Text("BACKUP FILES"),
                content:Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.cyanAccent[100],
                  child: SizedBox(
                    width: 300,
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.cyan[500],
                            radius: 100,
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://raw.githubusercontent.com/Shivyoddha/Learning-GITHUB/main/backupimg.png"), //NetworkImage
                              radius: 90,
                            ), //CircleAvatar
                          ), //CircleAvatar
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          Text(
                            'BACKUP DATA',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ), //Textstyle
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          const Text(
                            'Choose a Directory for backup of your data',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ), //Textstyle
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            child: Text("BackUp Location"),
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.cyan[800])),
                            onPressed: () async{
                              final Directory rootPath = await getTemporaryDirectory();
                                 backup = await FilesystemPicker.open(
                                title: 'Select Folder',
                                context: context,
                                rootDirectory:rootPath,
                                fsType: FilesystemType.folder,
                                pickText: 'Save backup to this folder',
                              );
                           },
                          ),
                          ),

                          SizedBox(
                            width: 100,

                            child: ElevatedButton(
                              onPressed: () {
                                       File(boxPath!).copy(backup!);},
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.cyan[800])),
                              child: Padding(
                                padding:  EdgeInsets.all(4),
                                child: Row(
                                  children:  [
                                    Text('BackUp')
                                  ],
                                ),
                              ),
                            ),
                            // RaisedButton is deprecated and should not be used
                            // Use ElevatedButton instead

                            // child: RaisedButton(
                            //   onPressed: () => null,
                            //   color: Colors.green,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(4.0),
                            //     child: Row(
                            //       children: const [
                            //         Icon(Icons.touch_app),
                            //         Text('Visit'),
                            //       ],
                            //     ), //Row
                            //   ), //Padding
                            // ), //RaisedButton
                          ) //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ),
              ))
            },
          ),
          ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('Why 21 days?'),
            onTap: () =>
            {
              showDialog(context: context, builder: (context) =>
                  AlertDialog(
                      title: Image.network(
                          "https://raw.githubusercontent.com/Shivyoddha/Learning-GITHUB/main/21rule.jpg"),
                      actions: [
                        TextButton(onPressed: () => Navigator.of(context).pop(),
                            child: Text("Cancel", style: TextStyle(color: Colors
                                .white),)),
                        TextButton(onPressed: () => Navigator.of(context).pop(),
                          child: Text("OK", style: TextStyle(color: Colors
                              .white,)),)
                      ]
                  )
              ),
            }
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: (){
              _auth.signOut();
              box1.close();
              box2.close();
              box3.close();
              Navigator.pushNamed(context, 'welcome_screen');
            },
          ),
        ],
      ),
    );
  }
}