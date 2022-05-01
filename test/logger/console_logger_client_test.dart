import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:wrapper_logger/logger/logger.dart';


class MockLogger extends Mock implements Logger {}

void main() {
  late MockLogger mockLogger;
  late ConsoleLoggerClient consoleLoggerClient;

  setUp(() {
    mockLogger = MockLogger();
    consoleLoggerClient = ConsoleLoggerClient(logger: mockLogger);
  });

  test('test console logger for debug', () {
    consoleLoggerClient.log(LoggerLevel.debug, 'hello');
    verify(mockLogger.d('hello'));
  });

  test('test console logger for error', () {
    consoleLoggerClient.log(LoggerLevel.error, 'hello');
    verify(mockLogger.e('hello'));
  });

  test('test console logger for warning', () {
    consoleLoggerClient.log(LoggerLevel.warning, 'hello');
    verify(mockLogger.w('hello'));
  });

  test('test console logger for verbose', () {
    consoleLoggerClient.log(LoggerLevel.verbose, 'hello');
    verify(mockLogger.v('hello'));
  });



}
