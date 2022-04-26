import 'package:wrapper_logger/config/env.dart';

class Production extends Env {
  Production(){
    envType = EnvType.production;
    appName = '';
    baseUrl = 'prod_url';
  }
}