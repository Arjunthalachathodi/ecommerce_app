import 'package:ecommerce_app/application/core/utils/logger.dart';
import 'package:ecommerce_app/domain/core/di/env.dart';





class ProductionEnv extends Env {




  ProductionEnv(String env)
      : super(domainUrl: 'https://bingo.lilacinfotech.com', env: env) {
    Logger.logInfo('App Started In Production Mode');
  }

  @override
  String toString() {
    return 'Production';
  }
}
