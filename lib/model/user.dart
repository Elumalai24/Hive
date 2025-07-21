import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User{
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;
  User(this.name, this.age);
}