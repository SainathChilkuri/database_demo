import 'dart:async';
import 'dart:io';

import 'package:database_demo/Model/user_model.dart';
import 'package:database_demo/Session/login_session.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  final TABLE_NAME ="usertable";
  final COL_ID = "id";
  final COL_FNAME ="firstname";
  final COL_LNAME="lastname";
  final COL_GENDER = "gender";
  final COL_EMAIL="email";
  final COL_NUM="number";
  final COL_PASS ="password";
  static Database _database;
  static DatabaseHelper _databaseHelper;
   Future<Database> get database async {
    if(_database== null){
      _database = await initializeDatabase();
    }
    return _database;
  }
  DatabaseHelper.createInstance();
  factory DatabaseHelper(){
     if(_databaseHelper == null){
       _databaseHelper = DatabaseHelper.createInstance();
     }
     return _databaseHelper;
  }

   Future<Database> initializeDatabase() async {
       Directory directory = await getApplicationDocumentsDirectory();
       String path = join(directory.path, 'user.db');
      Database db = await openDatabase(path,version: 1,onCreate: _createDB,onOpen: (db){});
      return db;
  }

   _createDB(Database db, int version) async{
    await db.execute("CREATE TABLE $TABLE_NAME ($COL_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COL_FNAME TEXT, $COL_LNAME TEXT, $COL_GENDER TEXT, $COL_EMAIL TEXT, $COL_NUM INTEGER, $COL_PASS TEXT)");
  }

  Future<int> insetData(UserModel user) async {
    Database db =await database;
    print(user.toMap());
    var result = await db.insert(TABLE_NAME, user.toMap());
    return result;
  }

  Future<dynamic> authenticateUser(email, pass) async {
    Database db = await database;
    print(email);
    var result =await db.query(TABLE_NAME,where:"$COL_EMAIL= ? and $COL_PASS=?",whereArgs: [email,pass]);
    //UserModel user = UserModel.fromMap(result[0]);
    //print(UserModel.fromMap(result[0]).gender);
    UserModel user = UserModel.fromMap(result[0]);

    if(result.length > 0){
      print("--------------------");
      print(user);
      await Sessions.storeData(user);
     return 1;
    }else{
      return 0;
    }
   /*if(user!= null){
      print(user.fname);
      return result;
    }else{
      //print(result);
      return ;
    }*/
  }
}