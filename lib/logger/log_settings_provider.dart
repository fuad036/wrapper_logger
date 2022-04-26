part of viva_logger;

abstract class LogSettingsProvider {
  bool isLogEnable();
  LoggerLevel logLevel();
}
