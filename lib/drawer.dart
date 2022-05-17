import  'package:flutter/material.dart';
import 'home.dart';
import 'pages/addblogpage.dart';
import 'pages/manageblog.dart';

class NavigationDrawerWidget extends StatelessWidget {

  final padding =EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Material(
        color: Colors.red,
        child: ListView(
          padding: padding,
        children: <Widget>[
          const SizedBox(
            height:48,
          ),
          buildMenuItem(
              text: 'Feeds',
              icon: Icons.home,
              onClicked: ()=>selectedItem(context, 0)),
          const SizedBox(
            height:16,
          ),
          Divider(color: Colors.white,), const SizedBox(height: 16,),
          buildMenuItem(
              text: 'Add Blog',
              icon: Icons.add_circle_outline,
              onClicked: ()=>selectedItem(context, 1)),
          const SizedBox(
            height:16,
          ),
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

// this is used to naviagte to the page
void selectedItem(BuildContext context, int index){
  Navigator.of(context).pop();
  switch(index){
    case 0:
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'feed',
      ),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddBlogPage(
      ),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ManageBlogPage(
      ),
      ));
      break;

}
}