import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BlogDatabase{
  //create a global field
  static final BlogDatabase instance = BlogDatabase._init();

  //add a new field for the database
  static Database? database;


  //create a private constructor
  BlogDatabase._init();

  //open connetion to the database
Future <Database> get database async{
  if
}
}