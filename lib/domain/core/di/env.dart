import 'package:ecommerce_app/application/core/utils/logger.dart';
















abstract class Env {

  final String domainUrl;


  final String env;


  static late Env instance;








  Env({
    required this.env,
    required this.domainUrl,
  }) {
    boot();
  }





  void boot() async {


    instance = this;

    Logger.logInfo('Domain Url: $domainUrl');
  }
}
