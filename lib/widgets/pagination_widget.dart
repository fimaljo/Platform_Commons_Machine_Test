import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_commons_machine_test/domain/home/models/movie_model.dart';

import '../application/home/bloc/home_bloc.dart';


class PaginationWidget<t> extends StatelessWidget {
  final Function() loadMore;
  final Widget initialError;
  final Widget initialLoading;
  final Widget initialEmpty;
  final Widget Function(t p) child;
  final Widget? onLoadMoreError;
  final Widget? onLoadMoreLoading;
  const PaginationWidget(
      {Key? key,
      required this.loadMore,
      required this.initialError,
      required this.initialLoading,
      required this.initialEmpty,
      this.onLoadMoreError,
      this.onLoadMoreLoading,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          List<MainData> products = state.movies.results;

          return NotificationListener<ScrollEndNotification>(
              onNotification: (scrollInfo) {
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent
                    ? loadMore()
                    : null;
                return true;
              },
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) =>
                              child(products[index] as t))),
                  const SizedBox(
                    height: 20,
                  ),
                  //if error occured while loading more
                  if (state.error != null)
                    Expanded(child: onLoadMoreError ?? initialError),
                  if (state.loading != null)
                    Expanded(child: onLoadMoreLoading ?? initialLoading),
                ],
              ));
        }
        if (state is MoviesInitialLoading) {
          return initialLoading;
        }
        if (state is MoviesEmpty) {
          return initialEmpty;
        }
        if (state is ProductInitialError) {
          return initialError;
        }
        return const SizedBox.shrink();
      },
    );
  }
}
