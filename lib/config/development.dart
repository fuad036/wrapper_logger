import 'package:wrapper_logger/config/env.dart';

class Development extends Env {
 Development(){
   envType = EnvType.development;
   appName = '';
   baseUrl = 'dev_url';

 }
}