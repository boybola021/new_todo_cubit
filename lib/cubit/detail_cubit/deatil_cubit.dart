

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../main.dart';
import '../../models/todo_model.dart';
part 'deatil_state.dart';

class DetailCubit extends Cubit<DetailState>{
  DetailCubit() : super(DetailInitial());

  void create(String title,String description)async{
    if(title.isEmpty || description.isEmpty){
      emit(const DetailFailure(message: "Please filds is empty"));
      return;
    }
    emit(DetailLoading());
    try{
      final todo = Todo(id: 1, title: title, description: description, isComplete: false);
      await sql.insert(todo);
      emit(const DetailCreateSuccess(message: "Todo success created full"));
    }catch (e){
      emit( DetailFailure(message: "Error Detail: $e"));
    }
  }

  void delate(int id)async{
    emit(DetailLoading());
    try{
      await sql.delate(id);
      emit(const DetailDelateSuccess(message: "Todo delate success full"));
    }catch(e){
      emit( DetailFailure(message: "Todo do not delate error: $e"));
    }
  }

  // void complete(Todo todo){
  //   emit(DetailLoading());
  //   try{
  //     todo.isComplete = !todo.isComplete;
  //      sql.update(todo);
  //     emit(const DetailUpdateSuccess(message: "Todo check"));
  //   }catch(e){
  //     emit( DetailFailure(message: "ERROR: $e"));
  //   }
  // }

  void complete(Todo todo)async {
    emit(DetailLoading());
    try {
      todo.isComplete = !todo.isComplete;
      sql.update(todo);
      emit(const DetailUpdateSuccess(message: "Todo update"));
    } catch (e) {
      emit(DetailFailure(message: "Detail ERROR: $e"));
    }
  }

  void edit(Todo todo,String title,String description)async {
    if(title.isEmpty || description.isEmpty){
      emit(const DetailFailure(message: "Please filds is empty"));
      return;
    }
   try{
     todo.title = title;
     todo.description = description;
     await sql.update(todo);
     emit(const DetailUpdateSuccess(message: "Todo success uptate"));
   }catch(e){
     emit( DetailFailure(message: "Todo do not uptate error:$e"));
   }

  }
}