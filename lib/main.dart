import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page.dart';
import 'model/user.dart';

void main()async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>("Users");
  runApp(MaterialApp(home: HomePage()));
}

