part of viva_logger;

class MyProdLogger implements MyLoggerClient {
  late MyLoggerClient _vivaLoggerClient;
  late LogSettingsProvider _logSettingsProvider;
  MyProdLogger(MyLoggerClient vivaLoggerClient,
      LogSettingsProvider logSettingsProvider) {
    _vivaLoggerClient = vivaLoggerClient;
    _logSettingsProvider = logSettingsProvider;
  }

  @override
  void log(LoggerLevel level, String message,
      [Object? error, StackTrace? stackTrace]) {
    if (_logSettingsProvider.isLogEnable() == false ||
        _logSettingsProvider.logLevel().index > level.index) {
      return;
    }
    _vivaLoggerClient.log(level, message, error, stackTrace);
  }
}
