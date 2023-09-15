import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_commons_machine_test/domain/home/models/movie_model.dart';

import '../../application/home/bloc/home_bloc.dart';
import '../../core/colors.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(MovieLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        bgcolor1(height),
        bgcolor2(height),
        bgcolor3(height),
        heading1(height),
        Positioned(
          top: height * 0.1,
          bottom: 0,
          right: 0,
          left: 0,
          child: PaginationWidget<MainData>(
            loadMore: () {
              BlocProvider.of<HomeBloc>(context).add(MovieLoadEvent());
            },
            initialEmpty: const EmptyWidget(),
            initialLoading: const LoadingWidget(),
            initialError: const CustomErrorWidget(),
            child: (MainData productModel) {
              return MovieCard(movie: productModel);
            },
          ),
        ),
      ],
    ));
  }
}

Positioned bgcolor1(double height) {
  return Positioned(
    bottom: height * 0.6,
    left: -50,
    child: Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(82, 156, 164, 173),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 50,
          sigmaY: 50,
        ),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.transparent,
        ),
      ),
    ),
  );
}

Positioned heading1(double height) {
  return Positioned(
    top: height * 0.0,
    child: const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 40,
          ),
          child: Row(
            children: [
              Text(
                "Trending ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                "Movies",
                style: TextStyle(
                    color: Color.fromARGB(145, 255, 255, 255), fontSize: 18),
              ),
            ],
          ),
        )
      ],
    ),
  );
}



Positioned bgcolor3(double height) {
  return Positioned(
    bottom: height * 0.1,
    left: 131,
    child: Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Constants.bgrey2,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 50,
          sigmaY: 50,
        ),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.transparent,
        ),
      ),
    ),
  );
}

Positioned bgcolor2(double height) {
  return Positioned(
    bottom: height * 0.5,
    right: -90,
    child: Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(97, 156, 164, 173),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 50,
          sigmaY: 50,
        ),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.transparent,
        ),
      ),
    ),
  );
}
