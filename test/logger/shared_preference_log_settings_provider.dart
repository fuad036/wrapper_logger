import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wrapper_logger/logger/logger.dart';

import 'shared_preference_log_settings_provider.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() async {
  final mockSharedPreferences = MockSharedPreferences();
  final sharedPreferenceLogSettingsProvider =
      SharedPreferenceLogSettingsProvider(mockSharedPreferences);

  test("check default logger state", () {
    bool isLogEnabled = sharedPreferenceLogSettingsProvider.isLogEnable();
    LoggerLevel loggerLevel = sharedPreferenceLogSettingsProvider.logLevel();

    expect(isLogEnabled, false);
    expect(loggerLevel, LoggerLevel.info);
  });

  test("logger state updated check", () async {
    when(mockSharedPreferences.setString(
            SharedPreferenceLogSettingsProvider.loggerLevelKey,
            LoggerLevel.error.name.toString()))
        .thenAnswer((realInvocation) async => true);
    when(mockSharedPreferences.setBool(
            SharedPreferenceLogSettingsProvider.isLogEnableKey, true))
        .thenAnswer((realInvocation) async => true);

    bool res = await sharedPreferenceLogSettingsProvider.updateSetting(
        true, LoggerLevel.error);

    expect(res, true);
  });
}
