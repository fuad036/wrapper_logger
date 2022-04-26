import 'package:flutter/material.dart';
import 'package:wrapper_logger/config/env.dart';
import 'package:wrapper_logger/logger/logger.dart';

import 'di/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wrapper_logger Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool enableLogger = false;

  @override
  void initState() {
    super.initState();
  }

  void _printLog() {
    try {
      sl<MyLogger>().verbose('hello from  verbose');
      sl.get<MyLogger>().debug('hello from  debug');
      sl.get<MyLogger>().info('hello from  info');
      sl.get<MyLogger>().warning('hello from  warning');
      sl<MyLogger>().error('hello from  error');
    } on Exception catch (e, stacktrace) {
      sl.get<MyLogger>().error('main class ', null, stacktrace);
      print(stacktrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Env.value.baseUrl + ' is selected'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'if you run the project in development environment you will get all kinds of logs printed in the console, in case of production environment you will only get error,warning and info logs, you can also use FileLoggerFLogClient class in case you want to log in file or remote destination, See the MyProdLogger class to realize how decorator is used',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16,),
                const Text(
                  'Press enable to enabling logging in your project',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                    onPressed: () {
                      if (!enableLogger) {
                        sl<SharedPreferenceLogSettingsProvider>()
                            .updateSetting(true, LoggerLevel.info);
                        enableLogger = !enableLogger;
                        setState(() {});
                      } else {
                        sl<SharedPreferenceLogSettingsProvider>()
                            .updateSetting(false, LoggerLevel.info);
                        enableLogger = !enableLogger;
                        setState(() {});
                      }
                    },
                    child: Text(enableLogger == false ? 'Enable' : 'Disable')),
                const SizedBox(
                  height: 24,
                ),
                TextButton(
                    onPressed:  _printLog,
                    child: const Text('print log in console'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
