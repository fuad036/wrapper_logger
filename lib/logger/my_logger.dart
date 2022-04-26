part of viva_logger;

class MyLogger {
  final MyLoggerClient _client;
  MyLogger(this._client);

  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    _client.log(LoggerLevel.debug, message, error, stackTrace);
  }

  void info(String message, [Object? error, StackTrace? stackTrace]) {
    _client.log(LoggerLevel.info, message, error, stackTrace);
  }

  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _client.log(LoggerLevel.error, message, error, stackTrace);
  }

  void verbose(String message, [Object? error, StackTrace? stackTrace]) {
    _client.log(LoggerLevel.verbose, message, error, stackTrace);
  }

  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _client.log(LoggerLevel.warning, message, error, stackTrace);
  }
}
