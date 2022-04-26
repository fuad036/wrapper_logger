part of viva_logger;

class FileLoggerClient extends MyLoggerClient {
  late final Logger _instance;
  FileLoggerClient() {
    Logger.level = Level.warning;
    _instance = Logger(printer: SimpleLogPrinter(), output: FileOutput());
  }
  @override
  void log(LoggerLevel level, String message,
      [Object? error, StackTrace? stackTrace]) {
    if (level == LoggerLevel.info) {
      _instance.d(message, error, stackTrace);
    } else if (level == LoggerLevel.warning) {
      _instance.w(message, error, stackTrace);
    } else if (level == LoggerLevel.error) {
      _instance.e(message, error, stackTrace);
    }
  }

  _write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/my_file.txt');
    await file.writeAsString(text);
  }

  static Future<String> read() async {
    String? text;
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/my_file.txt');
      text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    return text ?? 'Empty log';
  }
}

class FileOutput extends LogOutput {
  FileOutput();

  late File file;

  @override
  void output(OutputEvent event) async {
    Directory directory = await getApplicationDocumentsDirectory();
    file = File('${directory.path}/my_file.txt');
    try {
      for (var line in event.lines) {
        await file.writeAsString("${line.toString()}\n",
            mode: FileMode.writeOnlyAppend);
      }
      // String text = await file.readAsString();
      // print(text);
    } catch (e) {
      for (var line in event.lines) {
        debugPrint(line);
      }
    }
  }
}
