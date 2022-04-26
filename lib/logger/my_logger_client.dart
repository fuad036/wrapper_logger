part of viva_logger;

enum LoggerLevel {
  verbose,
  debug,
  info,
  warning,
  error,
}

abstract class MyLoggerClient{
  void log(LoggerLevel level, String message, [Object? error, StackTrace? stackTrace] );
}