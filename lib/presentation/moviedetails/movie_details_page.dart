import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_commons_machine_test/application/overView/bloc/movie_details_bloc.dart';

import '../../domain/home/models/movie_model.dart';
import '../../domain/home/moviedetails/movie_details.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/loading_widgets.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final argument = ModalRoute.of(context)!.settings.arguments;
      if (argument != null) {
        BlocProvider.of<MovieDetailsBloc>(context)
            .add(MovieDetailsLoadEvent(movieId: argument.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoaded) {
            MainData movieDetails = state.movie;

            return Column(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                  width: 200,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Title: ${movieDetails.title}',
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Overview:\n ${movieDetails.overview}',
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            );
          }
          if (state is MovieDetailsInitial) {
            return const LoadingWidget();
          }

          if (state is MovieDetailsError) {
            return const CustomErrorWidget();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
