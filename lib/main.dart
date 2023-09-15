import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_commons_machine_test/application/overView/bloc/movie_details_bloc.dart';
import 'package:platform_commons_machine_test/presentation/home/home_page.dart';
import 'package:platform_commons_machine_test/presentation/moviedetails/movie_details_page.dart';

import 'application/home/bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => MovieDetailsBloc())
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/movie_details': (context) => const MovieDetailsPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color.fromARGB(196, 9, 10, 14)),
      ),
    );
  }
}
