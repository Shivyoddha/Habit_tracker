import 'package:hive/hive.dart';

part 'habit.g.dart';

@HiveType(typeId: 1)
class Habit {
  Habit({required this.name,required this.number});
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int number;
}