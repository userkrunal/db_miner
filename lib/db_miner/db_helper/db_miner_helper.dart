import 'dart:io';

import 'package:db_miner/db_miner/model/quotes_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_MinerHelper
{

  static  DB_MinerHelper helper=DB_MinerHelper();


  Database? database;
  final String dbpath="dbase.db";
  final String quotes_table="quotestable";
  final String categorytable="categorytable";

  Future<Database?> createDB()
  async {
    if(database !=null)
      {
        return database;
      }
    else
      {
        return await intDB();
      }
  }

  Future<Database> intDB()
  async {
    Directory directory= await getApplicationDocumentsDirectory();
    String path=join(directory.path,dbpath);

    String quotes='CREATE TABLE $quotes_table(id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, quotes TEXT, name TEXT)';
    String category='CREATE TABLE $categorytable (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,image BLOB)';
    return database= await openDatabase(path,
      version: 1,
      onCreate: (db, version) async {

        await db.execute(quotes);
         await db.execute(category);
      },
    );
  }

  Future<void> insert(QuotesModel model)
  async {
    database=await createDB();
    await database!.insert("${quotes_table}",{
      "quotes":model.quotes,
      "category":model.category,
      "name":model.name,
    });
  }


  Future<List<Map>> read_DB({required category})
  async {
    database= await createDB();
    String query='SELECT * FROM $quotes_table WHERE category= "$category';
    List <Map> l1= await database!.rawQuery(query);
    return l1;
  }


  Future<Future<int>> deletequotes(id)
  async {
    database=await createDB();
    return database!.delete('$quotes_table',where: "id=?",whereArgs: [id]);
  }


  //---------------------------------categorydatat-------------------------------------------

  Future<void> categoryinsert(CategoryModel model)
  async {
    database=await createDB();
    await database!.insert("${categorytable}", {
      "category":model.category,
      "image":model.image,
    });
  }

  Future<List<Map>> categoryread_DB()
  async {
    database= await createDB();
    String query='SELECT * FROM $categorytable';
    List <Map> l2= await database!.rawQuery(query);
    return l2;
  }

  Future<Future<int>> deletecategory(id)
  async {
    database=await createDB();
    return database!.delete('$categorytable',where: "id=?",whereArgs: [id]);
  }

  Future<Future<int>> update({required QuotesModel model,required id})
  async {
    database = await createDB();
    return database!.update(quotes_table!, {
      'name':model.name,
      'quote':model.quotes,
      'category':model.category,
    },where: "id=?",whereArgs: [id]);
  }

}