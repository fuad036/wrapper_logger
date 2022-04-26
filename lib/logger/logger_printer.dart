part of viva_logger;

class SimpleLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    List<String> logs = [];
    DateTime now = DateTime.now();
    String errorCategoryString = event.level.toString();
    String message = event.message.toString();
    String errorObjectString =
        event.error == null ? 'null' : event.error.toString();
    String formattedDateTime = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    String stackTraceMessage =
        event.stackTrace == null ? 'null' : event.stackTrace.toString();
    String lineDivider =
        '\n----------------------------------------------------------------\n';
    String newLine = '\n';

    String logString = lineDivider +
        formattedDateTime +
        newLine +
        errorCategoryString +
        newLine +
        message +
        newLine +
        errorObjectString +
        newLine +
        stackTraceMessage +
        lineDivider
       ;

    logs.add(logString);
    return logs;
  }
}

final modifiedPrettyPrinter = PrettyPrinter(
  methodCount: 1,
  lineLength: 50,
  errorMethodCount: 3,
  colors: true,
  printEmojis: true,
);
