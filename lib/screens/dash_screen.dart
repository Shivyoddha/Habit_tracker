import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/habit.dart';
import 'package:habit_tracker_app/screens/profile.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:swipebuttonflutter/swipable_button.dart';
import 'NavBar.dart';
import 'LiquidBar.dart';
import 'registration_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'habit.dart';
class DashScreen extends StatefulWidget {



  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  late String nam;
  int i=0;
  List<LiquidBar> a=[];
  final _auth=FirebaseAuth.instance;
  late final  User loggedInUser;
  @override


  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser()async{
    try {

      final user = await _auth.currentUser!;
      if (_auth.currentUser== null)
        loggedInUser = user;
      print(loggedInUser);
    }
    catch(e){
    }
}
Widget buildButtomSheet(BuildContext context){

  var box1=Hive.box<Habit>('Box1');
  var box2=Hive.box<Profile>('Box2');
  return Container(
    color: Colors.white,
    child: Center(
     child:Column(
       children: [
         Text("NEW HABIT",style: TextStyle(
           fontWeight: FontWeight.w900,
           fontFamily: 'PoorStory',
           fontSize: 80.0,
           color: Colors.cyan[900],
         ),),
         SizedBox(
           height: 20.0,
         ),
         TextField(
           textAlign: TextAlign.center,
           onChanged: (value) {
              nam=value;
             //Do something with the user input.
           },
           style: TextStyle(color: Colors.cyan[900],fontFamily: 'PoorStory',fontSize: 30.0,fontWeight: FontWeight.w700),
           decoration: InputDecoration(
             fillColor: Colors.cyan.shade200,
             filled: true,
             hintText: 'HABIT NAME',
             hintStyle: TextStyle(color: Colors.cyan[900]),
             contentPadding:
             EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

           ),
         ),
         SizedBox(
           height: 50.0,
         ),
         SizedBox(
           height: 20.0,
         ),
         SizedBox(
           height: 60.0,
         ),
         SizedBox(
           width: 110,
           child: ElevatedButton(
             onPressed: (){
                    box1.put(i,Habit(name:nam,number:0));
               setState(() {
                 a.add(LiquidBar(i:a.length,a:a,nam:nam,num:0));
                 box1.put(a.length,Habit(name:nam,number:0));
               });
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
         )
       ],
     ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
   var box1=Hive.box<Habit>('Box1');
   var box2=Hive.box<Profile>('Box2');
   for(int j=0;j<a.length;j++)
     {
       Habit? habit=box1.get(j);
       if(habit==null)
         a.remove(j);
     }
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.white,
        drawer:NavDrawer(),
        appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.cyan,
        title: const Text("Habit Tracker",style: TextStyle(
          fontFamily: 'PoorStory',
          fontWeight: FontWeight.w800,
          fontSize: 40.0,
        ),),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20.0,
                child: FloatingActionButton(
                    onPressed:()=> Navigator.pushNamed(context, 'chart'),
                    child: ClipOval(child:Image.network('https://raw.githubusercontent.com/Shivyoddha/mi_card_flutter/master/anishimage.png')))),
          ],
        ),
          //
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          child:  Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
              setState(() {
                showModalBottomSheet(context: context, builder: buildButtomSheet);
              //  a.add(LiquidBar(i:a.length ,name:habit.name,number:habit.number,a:a));
              });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.edit),
              Icon(Icons.edit),
              Icon(Icons.edit),
              Icon(Icons.edit),
            ],
          ),
          color: Colors.cyan,
        ),

          //
        body: SingleChildScrollView(
          child: Column(
            children:<Widget>[
            Column(
              children: [
                for(int i=0;i<a.length;i++)
                 Padding(
                   padding: EdgeInsets.symmetric(vertical: 3.0,horizontal:1.0),
                     child:
                     a[i],
                 ),

              ],
            ),

            ],

          ),
        ),
    ));
  }                     
}






