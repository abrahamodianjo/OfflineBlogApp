import 'package:flutter/material.dart';
import '../drawer.dart';

class AddBlogPage extends StatelessWidget{
  const AddBlogPage ({ Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Scaffold (
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Add Blog'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}