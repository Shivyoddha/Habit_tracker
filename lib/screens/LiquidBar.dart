
import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/profile.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'dash_screen.dart';
import 'delete.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'habit.dart';
class LiquidBar extends StatefulWidget {
   List<LiquidBar> a=[];
   int i=0;
   late String nam;
   late int num=0;
  LiquidBar({Key? key,required this.i,required this.a,required this.nam,required this.num}) : super(key: key,){
  }

  @override
  State<LiquidBar> createState() => _LiquidBarState();
}

class _LiquidBarState extends State<LiquidBar> {
   late int count=widget.num;
   late double count2=widget.num+0.0;
   late double n=(100.0*(count))/21.00;
  @override
  Widget build(BuildContext context) {
    var box1=Hive.box<Habit>('Box1');
    var box2=Hive.box<Profile>('Box2');
    Habit? habit=box1.get(widget.i);
    return  Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.blue,
        child:Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
                child: Text(widget.nam,style: TextStyle(
                  fontFamily: 'PoorStory',
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),),
              ),
              Container(
                height:80.0,
                child: LiquidLinearProgressIndicator(
                  value:count/21.0, // Defaults to 0.5.
                  valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent), // Defaults to the current Theme's accentColor.
                  backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                  borderColor: Colors.black,
                  borderWidth: 0.0,
                  borderRadius: 12.0,
                  direction: Axis.horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                  center: Text(n.toStringAsFixed(2)+'%',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500,color:Colors.black,),),
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(onPressed: (){

                      box1.put(widget.i,Habit(name:widget.nam,number:count+1));
                      setState(() {
                       widget.num=widget.num+1;
                       count++;

                       n=(100.0*(count))/21.00;
                       if(n==100)
                         {
                           showDialog(context: context, builder: (context)=>AlertDialog(
                             backgroundColor: Colors.white,
                             title: Text("Congratulations",style: TextStyle(
                               color: Colors.cyan.shade900,
                               fontFamily: 'PoorStory',
                               fontWeight: FontWeight.w500,
                               fontSize: 40.0,
                             )),
                             content: Text("You have gained  the habit of "+widget.nam+".\nENJOY YOUR LIFE WITH THIS NEW HABIT",style: TextStyle(
                               color: Colors.cyan.shade900,
                               fontFamily: 'PoorStory',
                               fontWeight: FontWeight.w300,
                               fontSize: 20.0,
                             ),),
                           )
                           );
                         }
                         else if(n>100)
                           {
                             n=100;
                           }
                      });

                    },
                      child: Text("Done"),
                      style: ElevatedButton.styleFrom(
                        elevation: 50,
                        shadowColor: Colors.black,
                        primary: Colors.cyan[200],
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                          box1.delete(widget.i);
                  //      Delete(a:widget.a,i:widget.i);
                  //      widget.a.remove(widget.i);
                      });
                    },
                      child: Text("Delete Habit"),
                      style: ElevatedButton.styleFrom(
                        elevation: 50,
                        shadowColor: Colors.black,
                        primary: Colors.cyan[200],
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    ElevatedButton(onPressed: () {
                      showDialog(context: context, builder: (content)=>AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text(widget.nam,style: TextStyle(
                          color: Colors.cyan.shade900,
                          fontFamily: 'PoorStory',
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800,
                        ),),
                        content:Text("Congratulations.You have completed $count days streak of this habit.\nKeep doing to develop this awesome habit",style:TextStyle(
                          color: Colors.cyan.shade700,
                          fontFamily: 'PoorStory',
                          fontWeight: FontWeight.w800,
                        ),) ,
                      ));
                    },
                      child: Text("Show"),
                      style: ElevatedButton.styleFrom(
                        elevation: 50,
                        shadowColor: Colors.black,
                        primary: Colors.cyan[200],
                      ),
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }
}


