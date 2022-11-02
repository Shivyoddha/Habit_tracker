import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'habit.dart';
Future<void> backupHiveBox<T>(String boxName, String backupPath) async {
  final box =  Hive.box<T>(boxName);
  final boxPath = box.path;
  await box.close();

  try {
    File(boxPath!).copy(backupPath);
  } finally {
    await Hive.box<Habit>('Box1');
  }
}

Future<void> restoreHiveBox<T>(String boxName, String backupPath) async {
  final box1 =await Hive.box<Habit>('Box1');
  final boxPath = box1.path;

  try {
    File(backupPath).copy(boxPath!);
  } finally {
    await Hive.box<Habit>('Box1');
  }
}