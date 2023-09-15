
import 'package:flutter/material.dart';

import 'package:platform_commons_machine_test/domain/home/models/movie_model.dart';

import '../core/string.dart';

class MovieCard extends StatelessWidget {
  final MainData movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  void navigateDetailsPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/movie_details', arguments: movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateDetailsPage(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '$imageAppendUrl${movie.backdropPath}',
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      movie.title ?? "",
                      maxLines: 2,
                      style: const TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 10.0,
                              offset: Offset(1.0, 2.0),
                            ),
                          ],
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movie.overview.toString(),
                    maxLines: 2,
                    style: const TextStyle(shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        offset: Offset(1.0, 2.0),
                      ),
                    ], color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
