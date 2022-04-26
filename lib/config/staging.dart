import 'package:wrapper_logger/config/env.dart';

class Staging extends Env {
  Staging(){
    envType = EnvType.staging;
    appName = '';
    baseUrl = '';
  }
}