import 'package:ecommerce_app/domain/core/di/development.dart';
import 'package:ecommerce_app/domain/core/di/production.dart';
import 'package:ecommerce_app/domain/core/di/test_env.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';

import 'injection.config.dart';



final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true, 
  asExtension: false,
)


Future<void> configureDependency({required String env}) async {
  switch (env) {
    case Environment.prod:
      ProductionEnv(env);
    case Environment.test:
      TestEnv(env);
    case Environment.dev:
    default:
      DevelopmentEnv(env);
  }

  await init(
    sl,
    environment: Environment.prod,
  );
}











