import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_app/product_overview/bloc/product_overview_bloc.dart';

class ProductOverviewProvider extends StatelessWidget {
  const ProductOverviewProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductOverviewBloc(),
      child: child,
    );
  }
}