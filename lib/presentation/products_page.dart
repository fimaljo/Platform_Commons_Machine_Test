import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_commons_machine_test/domain/home/models/movie_model.dart';

import '../application/home/bloc/home_bloc.dart';
import '../widgets/widgets.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(MovieLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.red,
            size: 30,
          ),
          title: Text(
            "Flutter Pagination",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: PaginationWidget<MainData>(
          loadMore: () {
            BlocProvider.of<HomeBloc>(context).add(MovieLoadEvent());
          },
          initialEmpty: const EmptyWidget(),
          initialLoading: const LoadingWidget(),
          initialError: const CustomErrorWidget(),
          child: (MainData productModel) {
            return ProductCard(product: productModel);
          },
        ));
  }
}
