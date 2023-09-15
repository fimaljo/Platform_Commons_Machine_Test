import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c, i) => Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: glassShimmerBuilder(
            child: GlassContainer(
              width: 200,
              height: 250,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      ),
      itemCount: 5,
    );
  }

  Widget glassShimmerBuilder({required Widget child}) {
    return Shimmer(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.5, 1.0],
        colors: [
          Colors.grey.shade300
              .withOpacity(0.5), // Adjust opacity for the glass effect
          Colors.grey.shade100
              .withOpacity(0.7), // Adjust opacity for the glass effect
          Colors.grey.shade50
              .withOpacity(0.5), // Adjust opacity for the glass effect
        ],
      ),
      child: child,
    );
  }
}

class GlassContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;

  GlassContainer({
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!
          .withOpacity(0.5), // Adjust opacity for the glass effect
      highlightColor: Colors.grey[100]!
          .withOpacity(0.7), // Adjust opacity for the glass effect
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor
              .withOpacity(0.2), // Adjust opacity for the glass effect
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white
                  .withOpacity(0.2), // Adjust opacity for the glass effect
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: glassShimmerBuilder(
                  child: Container(
                    height: 10,
                    width: 150,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              glassShimmerBuilder(
                child: Container(
                  height: 10,
                  width: 100,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget glassShimmerBuilder({required Widget child}) {
    return Shimmer(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.5, 1.0],
        colors: [
          Colors.grey.shade300
              .withOpacity(0.5), // Adjust opacity for the glass effect
          Colors.grey.shade100
              .withOpacity(0.7), // Adjust opacity for the glass effect
          Colors.grey.shade50
              .withOpacity(0.5), // Adjust opacity for the glass effect
        ],
      ),
      child: child,
    );
  }
}
