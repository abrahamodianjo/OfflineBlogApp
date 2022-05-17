import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BlogDatabase{
  //create a global field
  static final BlogDatabase instance = BlogDatabase._init();

  //add a new field for the database
  static Database? _database;


  //create a private constructor
  BlogDatabase._init();

  //open connetion to the database
Future <Database> get database async{
  if (_database !=null) return _database!;

    //if database does not exist, initialize it
  _database = await _initDB('blog.db');
  return _database!;
}
  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path =join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  Future _createDB(Database db, int version) async{}

  Future close()async{
  final db = await instance.database;
  db.close();
  }
}