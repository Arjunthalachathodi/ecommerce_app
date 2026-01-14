import 'package:flutter/material.dart';
import 'package:ecommerce_app/application/core/app_details.dart';
import 'package:ecommerce_app/application/core/route/app_route.dart';
import 'package:ecommerce_app/application/core/theme/app_theme.dart';
import 'package:ecommerce_app/application/core/theme/theme/theme_cubit.dart';
import 'package:ecommerce_app/application/core/utils/enums.dart';
import 'package:ecommerce_app/domain/core/di/injection.dart';
import 'package:ecommerce_app/presentation/core/app_root.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_app/application/products/cubit/product_cubit.dart';
import 'package:ecommerce_app/application/products/cubit/product_details_cubit.dart';
import 'application/application.dart';
import 'domain/domain.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependency(env: Environment.test);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    AppDetails.screenSize = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ThemeCubit>()),
        BlocProvider(create: (context) => sl<ProductCubit>()),
        BlocProvider(create: (context) => sl<ProductDetailsCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: AppDetails.globalNavigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Ecommerce App',
            onGenerateRoute: AppRoute.onGenerateRoute,
            initialRoute: AppRoot.routeName,
            theme: AppTheme.getTheme(AppThemeMode.light),
            builder: (context, child) => Stack(
              children: [
                child!,
                const DropdownAlert(),
              ],
            ),
          );
        },
      ),
    );
  }
}
