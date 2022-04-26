import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wrapper_logger/config/env.dart';
import 'package:wrapper_logger/logger/logger.dart';

GetIt sl = GetIt.instance;
Future<void> setUpServiceLocator() async {
  await sl.reset();
}

Future<void> initLogger(EnvType envType) async {
  sl.registerSingleton(SharedPreferenceLogSettingsProvider(
      await SharedPreferences.getInstance()));

  switch (envType) {
    case EnvType.production:
      sl.registerSingleton(MyLogger(MyProdLogger(
        ConsoleLoggerClient(logger: Logger(printer: PrettyPrinter())),
        sl.get<SharedPreferenceLogSettingsProvider>(),
      )));
      break;
    default:
      sl.registerSingleton(MyLogger(
          ConsoleLoggerClient(logger: Logger(printer: PrettyPrinter()))));
  }
}
