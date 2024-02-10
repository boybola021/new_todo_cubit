

import 'package:flutter/material.dart';
import 'package:new_todo/main.dart';
import '../cubit/detail_cubit/deatil_cubit.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void initState() {
  homeCubit.fetchTodo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    detailCubit.stream.listen((state) {
      if(state is DetailDelateSuccess){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully Deleted!")));
      }
      if(state is DetailDelateSuccess || state is  DetailCreateSuccess){
        homeCubit.fetchTodo();
      }
      if(state is DetailUpdateSuccess){
        homeCubit.fetchTodo();
      }
    });
    return  Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        actions: [
          StreamBuilder(
            stream: themeCubit.stream,
            initialData: themeCubit.state,
            builder: (context,state){
              return  IconButton(
                  onPressed:() => themeCubit.changeMode(),
                  icon: Icon(state.data == ThemeMode.light? Icons.dark_mode_outlined : Icons.light_mode ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailPage()));
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: homeCubit.stream,
        initialData: homeCubit.state,
        builder: (context,_) {
          final data = homeCubit.state;
          return ListView.builder(
             itemCount: data.todos.length,
              itemBuilder: (context,i){
               final item =  data.todos[i];
                return Card(
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(todo: item,)));
                    },
                    leading: IconButton(
                      onPressed: () => detailCubit.complete(item),
                      icon: Icon(item.isComplete? Icons.check_box : Icons.check_box_outline_blank),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.description),
                    trailing: IconButton(
                      onPressed: () => detailCubit.delate(item.id),
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              }
          );
        }
      ),
    );
  }
}
