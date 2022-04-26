part of viva_logger;

class FileLoggerFLogClient extends MyLoggerClient {
  FileLoggerFLogClient() {
    LogsConfig config = FLog.getDefaultConfigurations()
      ..isDevelopmentDebuggingEnabled = true
      ..timestampFormat = TimestampFormat.TIME_FORMAT_READABLE
      ..formatType = FormatType.FORMAT_CUSTOM
      ..fieldOrderFormatCustom = [
        FieldName.TIMESTAMP,
        FieldName.LOG_LEVEL,
        FieldName.CLASSNAME,
        FieldName.METHOD_NAME,
        FieldName.TEXT,
        FieldName.EXCEPTION,
        FieldName.STACKTRACE
      ]
      ..customOpeningDivider = "{"
      ..customClosingDivider = "}"
      ..activeLogLevel = LogLevel.ALL;

    FLog.applyConfigurations(config);
  }
  @override
  void log(LoggerLevel level, String message,
      [Object? error, StackTrace? stackTrace]) {

    FLog.debug(
        className: "class_name1", methodName: "_function_name", text: "My debug log");
    FLog.error(
        className: "class_name2", methodName: "_function_name", text: "My error log");
    FLog.warning(
        className: "class_name3", methodName: '_function_name', text: "My warning");

    FLog.printLogs();
  }

  static printLastHourLog() async {
    List<Log> _allLogs =
        await FLog.getAllLogsByFilter(filterType: FilterType.LAST_24_HOURS);

    print(_allLogs.toString());
  }
  static printLast24HoursLog() async {
    List<Log> _allLogs =
    await FLog.getAllLogsByFilter(filterType: FilterType.LAST_24_HOURS);

    print(_allLogs.toString());
  }

  static  deleteAlLog() async {
    await FLog.clearLogs();
  }




}
