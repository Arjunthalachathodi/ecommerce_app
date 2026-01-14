import 'package:flutter/material.dart';
import 'package:ecommerce_app/application/core/utils/logger.dart';
import 'package:ecommerce_app/domain/products/models/product_model.dart';
import 'package:ecommerce_app/presentation/core/app_root.dart';
import 'package:ecommerce_app/presentation/products/category_products_screen.dart';
import 'package:ecommerce_app/presentation/products/edit_product_screen.dart';
import 'package:ecommerce_app/presentation/products/product_details_screen.dart';
import 'package:ecommerce_app/presentation/products/product_list_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Logger.logWarning(
      'Route Name: ${settings.name},  Arguments: ${settings.arguments}, ArgumentType: ${settings.arguments.runtimeType}',
    );


    switch (settings.name) {
      case AppRoot.routeName:
        return pushRoute(settings, const AppRoot());
      case ProductListScreen.routeName:
        return pushRoute(settings, const ProductListScreen());
      case ProductDetailsScreen.routeName:
        final id = settings.arguments as int;
        return pushRoute(settings, ProductDetailsScreen(productId: id));
      case EditProductScreen.routeName:
        final product = settings.arguments as ProductModel;
        return pushRoute(settings, EditProductScreen(product: product));
      case CategoryProductsScreen.routeName:
        final args = settings.arguments as Map<String, dynamic>;
        return pushRoute(
          settings,
          CategoryProductsScreen(
            categoryName: args['categoryName'] as String,
            products: args['products'] as List<ProductModel>,
          ),
        );
      default:
        return pushRoute(settings, const AppRoot());
    }
  }

  static Route<dynamic> pushRoute(RouteSettings settings, Widget screen) {
    return PageTransition(
      settings: settings,
      child: screen,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 400),
      type: PageTransitionType.rightToLeft,
    );
  }
}
