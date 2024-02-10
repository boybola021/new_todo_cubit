
import 'package:bloc/bloc.dart';
import 'package:new_todo/main.dart';
import 'package:new_todo/models/todo_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());

  void fetchTodo()async{
  emit(HomeLoading(todos: state.todos));
   try{
     final todos = await sql.fetchTodos();
     emit(HomeFetchSuccess(todos: todos));
   }catch(e){
     emit(HomeFailure(todos: state.todos, message: "ERROR: $e"));
   }
  }
}