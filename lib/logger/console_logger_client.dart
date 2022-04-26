
part of viva_logger;

class ConsoleLoggerClient extends MyLoggerClient {
  late final Logger _instance;
  ConsoleLoggerClient({
    required Logger logger
  }){
    _instance = logger;
    Logger.level = Level.verbose;
  }
  @override
  void log(LoggerLevel level, String message, [Object? error, StackTrace? stackTrace]) {
    if(level == LoggerLevel.verbose){
      _instance.v(message,error,stackTrace);
    }
    else if(level == LoggerLevel.debug){
      _instance.d(message,error,stackTrace);

    }
    else if(level == LoggerLevel.info){
      _instance.i(message,error,stackTrace);

    }
    else if(level == LoggerLevel.warning){
      _instance.w(message,error,stackTrace);

    }
    else if(level == LoggerLevel.error){
      _instance.e(message,error,stackTrace);

    }
  }

}