import 'package:ecommerce_app/application/core/utils/extentions.dart';
import 'package:ecommerce_app/application/core/utils/logger.dart';
import 'package:ecommerce_app/domain/core/di/env.dart';





class DevelopmentEnv extends Env {




  DevelopmentEnv(String env)
      : super(
          domainUrl: 'http://192.168.29.8:8080',
          env: env,
        ) {
    Logger.logInfo('App Started In Development Mode');
  }

  @override
  String toString() {
    return env.capitalize;
  }
}
