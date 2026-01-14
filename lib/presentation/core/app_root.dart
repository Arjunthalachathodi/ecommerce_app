import 'package:flutter/material.dart';

import 'package:ecommerce_app/presentation/products/product_list_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  static const routeName = 'app-root';

  @override
  Widget build(BuildContext context) {
    return const ProductListScreen();
  }
}
