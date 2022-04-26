import 'package:flutter/cupertino.dart';
import 'package:wrapper_logger/di/service_locator.dart';


enum EnvType { development, staging, production }

class Env {
  Env() {
    value = this;
  }

  static late Env value;
  late String appName;
  late String baseUrl;
  late EnvType envType;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setUpServiceLocator();
    await sl.allReady();


  }

}
