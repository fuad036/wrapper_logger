import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wrapper_logger/logger/logger.dart';

import 'my_prod_logger_test.mocks.dart';


@GenerateMocks([MyLoggerClient, LogSettingsProvider])
void main() {
  final mockVivaLoggerClient = MockMyLoggerClient();
  final mockLogSettingsProvider = MockLogSettingsProvider();
  final myProdLogger =
      MyProdLogger(mockVivaLoggerClient, mockLogSettingsProvider);

  void setLogger(bool isLogEnable, LoggerLevel loggerLevel) {
    when(mockLogSettingsProvider.isLogEnable()).thenAnswer((_) => isLogEnable);
    when(mockLogSettingsProvider.logLevel()).thenAnswer((_) => loggerLevel);
  }

  test("logger is off , no log will be occurred", () {
    setLogger(false, LoggerLevel.info);

    myProdLogger.log(LoggerLevel.info, 'hello');

    verifyNever(mockVivaLoggerClient.log(LoggerLevel.info, 'hello'));
  });

  test("logger is on , log will be occurred successfully", () {
    setLogger(true, LoggerLevel.info);

    myProdLogger.log(LoggerLevel.info, 'hello');

    verify(mockVivaLoggerClient.log(LoggerLevel.info, 'hello')).called(1);
  });

  test("logger is on , lower loggerLevel will not be executed", () {
    setLogger(true, LoggerLevel.error);

    myProdLogger.log(LoggerLevel.info, 'hello');

    verifyNever(mockVivaLoggerClient.log(LoggerLevel.info, 'hello'));
  });

  test("logger is on , upper or equal loggerLevel will be executed", () {
    setLogger(true, LoggerLevel.error);

    myProdLogger.log(LoggerLevel.warning, 'hello');

    verifyNever(mockVivaLoggerClient.log(LoggerLevel.warning, 'hello'));
  });

  test("logger optional parameters happy test", () {
    String errorObject = 'this is a object';
    StackTrace stackTrace = StackTrace.fromString('string stackTrace');
    setLogger(true, LoggerLevel.info);

    myProdLogger.log(LoggerLevel.info, 'hello', errorObject, stackTrace);

    verify(mockVivaLoggerClient.log(
            LoggerLevel.info, 'hello', errorObject, stackTrace))
        .called(1);
  });

  test("logger optional parameters null value test", () {
    setLogger(true, LoggerLevel.info);

    myProdLogger.log(LoggerLevel.info, 'hello', null, null);

    verify(mockVivaLoggerClient.log(LoggerLevel.info, 'hello', null, null))
        .called(1);
  });

  test("logger optional parameters(has error null , has stacktrace ", () {
    StackTrace stackTrace = StackTrace.fromString('string stackTrace');
    setLogger(true, LoggerLevel.info);

    myProdLogger.log(LoggerLevel.info, 'hello', null, stackTrace);

    verify(mockVivaLoggerClient.log(
            LoggerLevel.info, 'hello', null, stackTrace))
        .called(1);
  });

  test("logger optional parameters(has error object , stacktrace null", () {
    String errorObject = 'this is a object';
    setLogger(true, LoggerLevel.info);

    myProdLogger.log(LoggerLevel.info, 'hello', errorObject, null);

    verify(mockVivaLoggerClient.log(
            LoggerLevel.info, 'hello', errorObject, null))
        .called(1);
  });
}
