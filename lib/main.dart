
import 'package:flutter/cupertino.dart';
import 'package:new_todo/cubit/detail_cubit/deatil_cubit.dart';
import 'package:new_todo/cubit/home_cubit/home_cubit.dart';
import 'package:new_todo/cubit/theme_cubit/theme_cubit.dart';
import 'package:new_todo/services/sql_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'app/app.dart';

final sql = SQLService();
final homeCubit = HomeCubit();
final detailCubit = DetailCubit();
final themeCubit = ThemeCubit();

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  /// setter
  final databasePath = await getDatabasesPath();
  final path = join(databasePath,"TodoApp");
  await sql.open(path);

  runApp(const App());
}