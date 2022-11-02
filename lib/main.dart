import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/profile.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/dash_screen.dart';
import 'screens/chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'screens/habit.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(ProfileAdapter());
  var box3= await Hive.openBox('Box3');
  var box1= await Hive.openBox<Habit>('Box1');
  var box2=await Hive.openBox<Profile>('Box2');
  runApp(const Ktrack());
}
 class Ktrack extends StatefulWidget {
   const Ktrack({Key? key}) : super(key: key);

   @override
   State<Ktrack> createState() => _KtrackState();
 }

 class _KtrackState extends State<Ktrack> {
   @override
   Widget build(BuildContext context) {

     return MaterialApp(
       theme: ThemeData.dark(),
       initialRoute:'welcome_screen',
       routes: {
         'welcome_screen':(context)=>WelcomeScreen(),
         'login_screen':(context)=>LoginScreen(),
         'registration_screen':(context)=>RegistrationScreen(),
         'dash_screen':(context)=>DashScreen(),
         'chart':(context)=>chart(),
     },
     );
   }
 }

