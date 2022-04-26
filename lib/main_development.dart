import 'package:flutter/material.dart';
import 'package:wrapper_logger/config/env.dart';
import 'package:wrapper_logger/home_screen.dart';
import 'config/development.dart';
import 'di/service_locator.dart';


Future<void> main() async {
  final environment = Development();
  await environment.init();
  await initLogger(EnvType.development);
  runApp(const MyApp());
}
