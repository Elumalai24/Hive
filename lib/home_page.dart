import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'model/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final hiveBox = Hive.box<User>("Users");
    return Scaffold(appBar: AppBar(title: Text("Hive")),
    body: ValueListenableBuilder(
      valueListenable: hiveBox.listenable(),
      builder: (context, Box<User> box, _) {
        return ListView.builder(
             itemCount: box.length,
            itemBuilder: (context, index){
               final user = box.getAt(index);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name ${user?.name ?? ""}"),
                Text("Age ${user?.age ?? ""}"),
              ],
            ),
          );
        });
      }
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        hiveBox.add(User("dhina", 25));
      }, child: Icon(Icons.add),),
    );
  }
}
