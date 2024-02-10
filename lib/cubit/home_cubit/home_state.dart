

part of 'home_cubit.dart';
abstract class HomeState{
 final List<Todo> todos;
 const HomeState({required this.todos});
}

class HomeInitial extends HomeState{
  HomeInitial() : super(todos: []);
}

class HomeFailure extends HomeState{
  final String message;
  const HomeFailure({required super.todos,required this.message});

}

class HomeFetchSuccess extends HomeState{
  HomeFetchSuccess({required super.todos});
}

class HomeLoading extends HomeState{
  HomeLoading({required super.todos});
}