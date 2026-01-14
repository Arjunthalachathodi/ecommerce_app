import 'package:ecommerce_app/application/core/utils/logger.dart';
import 'package:ecommerce_app/domain/core/di/env.dart';





class TestEnv extends Env {




  TestEnv(String env)
      : super(domainUrl: 'https://test.bingo.lilacinfotech.com', env: env) {
    Logger.logInfo('App Started In Staging Mode');
  }

  @override
  String toString() {
    return 'Staging';
  }
}
