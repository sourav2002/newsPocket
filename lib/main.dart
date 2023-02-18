import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task/core/repositories/news_repository.dart';
import 'package:news_task/core/view_models/bloc/news_bloc.dart';
import 'package:news_task/ui/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF151026);
    return BlocProvider(
      create: (BuildContext context) => NewsBloc(
        RepositoryProvider.of<NewsRepository>(context),
      )..add(FetchNewsEvent()),
      child: MaterialApp(
        title: 'Pocketful News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: RepositoryProvider(
            create: (context) => NewsRepository(), child: const Home()),
      ),
    );
  }
}
