part of viva_logger;

class SharedPreferenceLogSettingsProvider implements LogSettingsProvider {
  static const String loggerLevelKey = 'loggerLevel';
  static const String isLogEnableKey = "isLogEnable";
  late final SharedPreferences _sharedPreferences;
  SharedPreferenceLogSettingsProvider(SharedPreferences sharedPreferences){
    _sharedPreferences = sharedPreferences;
  }

  bool _isLogEnable = false;
  LoggerLevel _loggerLevel = LoggerLevel.info;

  void loadSetting() async{
    _isLogEnable = _sharedPreferences.getBool('isLogEnable') ?? false;

    String loggerLevel = _sharedPreferences.getString('loggerLevel') ?? 'info';
    List<LoggerLevel> levels = LoggerLevel.values;
    _loggerLevel = levels.firstWhere((element) => element.name == loggerLevel);

  }

  @override
  bool isLogEnable() {
    return _isLogEnable;
  }

  @override
  LoggerLevel logLevel() {
    return _loggerLevel;
  }

  Future<bool> updateSetting(bool isEnable, LoggerLevel loggerLevel) async{
    try{
      await _sharedPreferences.setString(loggerLevelKey, loggerLevel.name.toString());
      await _sharedPreferences.setBool(isLogEnableKey,isEnable);
      _isLogEnable = isEnable;
      _loggerLevel = loggerLevel;
      return true;
    }
    catch (e){
      return false;
    }

  }

}