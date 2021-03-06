import 'package:offlineblogapp/model/blogmodel.dart';
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

  // this is were we will create the table
  Future _createDB(Database db, int version) async{

  //basically this are the values i want to save in the table
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';  //Set the ID to auto increment
    final boolType = 'BOOLEAN NOT NULL'; //Set the boolian to not be null
    final integerType = 'INTEGER NOT NULL'; //Set the integer to not be null
    final textType = 'TEXT NOT NULL '; //Set the text to not be null
    final imageType = 'IMAGE NOT NULL'; // Set the image to not null


    // now to execute the sql query please note that in the bracket there most be quotes to avoid error

    await db.execute(''' CREATE TABLE $blogTable (
      ${BlogFields.id}$idType,
      ${BlogFields.isImportant}$boolType,
      ${BlogFields.number}$integerType,
      ${BlogFields.image}$imageType,
      ${BlogFields.title}$textType,
      ${BlogFields.description}$textType,
      ${BlogFields.time}$textType,      
    )''');

  }

  // now to create a blog
  Future<Blog> createBlogItem(Blog blog) async{
    final db = await instance.database;
    final id = await db.insert(blogTable, blog.toJson());
    return blog.copy(id: id);
  }

  Future<Blog> readBlogItem(int id) async {
  final db = await instance.database;

  //tells the table to read the blog items via the id
  final maps = await db.query(
    blogTable,
    columns: BlogFields.values,
    where: '${BlogFields.id} =?',
    whereArgs:[id],

  );
  // if the blog is not empty, it should return the first item

  if (maps.isNotEmpty){
    return Blog.fromJson(maps.first);
  }
  else
  //else it should return id not found
    {
      throw Exception('ID $id is not found in blog item');
    }
  }
// update blog items using the id
  Future<int> updateBlogItem(Blog blog) async {
  final db = await instance.database;

  return await db.update(
    blogTable,
    blog.toJson(),
    where: '${BlogFields.id} = ?',
    whereArgs: [blog.id],

  );

  }
// used to deelete blog items using the id
  Future<int> delete(int id) async {
  final db = await instance.database;
  return await db.delete(
    blogTable,
    where: '${BlogFields.id} = ?',
    whereArgs: [id],
  );
  }

  //this closes the database
  Future close()async{
  final db = await instance.database;
  db.close();
  }
}