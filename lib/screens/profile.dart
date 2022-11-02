import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 2)
class Profile {
  Profile({required this.name,required this.phone});
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String phone;
}