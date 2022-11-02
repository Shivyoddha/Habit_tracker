import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'dash_screen.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'LiquidBar.dart';

class Delete{
  late List<LiquidBar> a;
  late int i;
  Delete({Key? key,a,i}) ;
  void delete(a,i)
  {
    a.remove(i);
  }

}