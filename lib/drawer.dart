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
          buildMenuItem(text: 'Feeds', icon: Icons.home, onClicked: ()=>selectedItem(context, 0)),
        ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  return ListTile(
    leading: Icon(icon, color: color,),
    title: Text(text,
      style: TextStyle(color:color),

    ),
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index){
  Navigator.of(context).pop();
  switch(index){
    case 0:
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'feed',
      ),
      ));
}
}