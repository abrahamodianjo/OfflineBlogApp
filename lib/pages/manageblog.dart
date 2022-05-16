import 'package:flutter/material.dart';
import '../drawer.dart';

class ManageBlog extends StatelessWidget{
  const ManageBlog ({ Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Scaffold (
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Manage Blog'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}