
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import '../models/todo_model.dart';

const String todoTable = "TODO";


class SQLService{
  late Database db;

  Future<void> open(String path)async{
    db = await openDatabase(path,version: 1);
    if(!db.isOpen){
      await db.execute('''
create table if not exists TODO (
  id integer primary key autoincrement,
  title text not null,
  description text not null,
  isCompleted integer not null)
''');
    }
  }

  Future<Todo> insert(Todo todo)async{
    todo.id = await db.insert(todoTable, todo.toJson()..remove("id"));
    return todo;
  }

  Future<int> delate(int id)async{
    return await db.delete(todoTable,where: "id = ?",whereArgs: [id]);
  }

  Future<int> update(Todo todo)async{
    return await db.update(todoTable,todo.toJson(),where: "id = ?",whereArgs: [todo.id]);
  }

  Future<Todo?> getTodo(int id)async{
    List<Map> maps = await db.query(todoTable,where: "id = ?",whereArgs: [id]);
    if(maps.isNotEmpty){
      return Todo.fromJson(Map<String,Object>.from(maps.first));
    }
    return null;
  }

  Future<List<Todo>> fetchTodos()async{
    List<Map> maps = await db.query(todoTable);
    return maps.map((json) => Todo.fromJson(Map<String,Object>.from(json))).toList();
  }
}