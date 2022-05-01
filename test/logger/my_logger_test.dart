import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:wrapper_logger/logger/logger.dart';

class MockMyLoggerClient extends Mock implements MyLoggerClient {}

void main() {
  late MockMyLoggerClient mockMyLoggerClient;
  late MyLogger myLogger;

  setUpAll(() {
    mockMyLoggerClient = MockMyLoggerClient();
    myLogger = MyLogger(mockMyLoggerClient);
  });

  group('Test viva logger for different Log category', () {
    test('verbose log called', () {
      myLogger.verbose('hello');
      verify(mockMyLoggerClient.log(LoggerLevel.verbose, 'hello'));
    });
    test('info log called', () {
      myLogger.info('hello');
      verify(mockMyLoggerClient.log(LoggerLevel.info, 'hello'));
    });
    test('Warning log called', () {
      myLogger.warning('hello');
      verify(mockMyLoggerClient.log(LoggerLevel.warning, 'hello'));
    });
    test('debug log called', () {
      myLogger.debug('hello');
      verify(mockMyLoggerClient.log(LoggerLevel.debug, 'hello'));
    });
    test('error log called', () {
      myLogger.error('hello');
      verify(mockMyLoggerClient.log(LoggerLevel.error, 'hello'));
    });


  });
}
