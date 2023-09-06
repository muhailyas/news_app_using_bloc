import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/bloc/data_bloc/data_bloc_bloc.dart';
import 'package:news_app_bloc/views/home/home_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => NewsBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Karma News',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0)),
      home: const ScreenHome(),
    );
  }
}
