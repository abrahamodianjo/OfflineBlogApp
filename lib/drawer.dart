import  'package:flutter/material.dart';
import 'home.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Material(
        color: Colors.red,
        child: ListView(
        children: <Widget>[
          const SizedBox(
            height:48,
          ),
          buildMenuItem(text: 'Home', icon: Icons.home),
        ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
}) {
  final color = Colors.white;
  return ListTile(
    leading: Icon(icon, color: color,),
    title: Text(text, style: TextStyle(color:color), ),
  );
}