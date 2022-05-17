import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BlogDatabase{
  //create a global field
  static final BlogDatabase instance = BlogDatabase._init();

  //create a private constructor
  BlogDatabase._init();
}