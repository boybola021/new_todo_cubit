part of 'deatil_cubit.dart';

@immutable
abstract class DetailState{
  const DetailState();
}

class DetailInitial extends DetailState{}

class DetailDelateSuccess extends DetailState{
  final String message;
  const DetailDelateSuccess({required this.message});
}
class DetailUpdateSuccess extends DetailState{
 final String message;
 const DetailUpdateSuccess({required this.message});
}
class DetailCreateSuccess extends DetailState{
  final String message;
  const DetailCreateSuccess({required this.message});
}

class DetailFailure extends DetailState{
  final String message;
  const DetailFailure({required this.message});
}

class DetailRead extends DetailState{

}
class DetailLoading extends DetailState{

}

