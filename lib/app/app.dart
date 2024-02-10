import 'package:flutter/material.dart';
import 'package:new_todo/main.dart';

import '../pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: themeCubit.state,
        stream: themeCubit.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: snapshot.data,
            theme: ThemeData(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            home: HomePage(),
          );
        },
    );
  }
}
