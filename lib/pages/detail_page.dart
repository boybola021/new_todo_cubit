import 'package:flutter/material.dart';
import 'package:new_todo/cubit/detail_cubit/deatil_cubit.dart';
import 'package:new_todo/main.dart';
import '../models/todo_model.dart';

class DetailPage extends StatelessWidget {
  final Todo? todo;

  DetailPage({Key? key, this.todo}) : super(key: key);

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();

  void initState() {
    titleCtrl.text = todo?.title ?? "";
    descCtrl.text = todo?.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    initState();
    detailCubit.stream.listen((state) {
      if (state is DetailFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text((detailCubit.state as DetailFailure).message)));
      }
      if ((state is DetailCreateSuccess ||
          state is DetailUpdateSuccess) &&
          context.mounted) {
        Navigator.of(context).pop();
      }
    });
    return StreamBuilder(
      initialData: detailCubit.state,
      stream: detailCubit.stream,
      builder: (context,_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Detail"),
            actions: [
              IconButton(
                onPressed: () {
                  if (todo == null) {
                    detailCubit.create(titleCtrl.text, descCtrl.text);
                  } else {
                    detailCubit.edit(todo!, titleCtrl.text, descCtrl.text);
                  }
                },
                icon: const Icon(Icons.save),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child:  Column(
              children: [
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(
                    hintText: "title",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: descCtrl,
                  decoration: const InputDecoration(
                    hintText: "description",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
