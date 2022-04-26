import 'package:flutter/material.dart';
import 'config/env.dart';
import 'config/production.dart';
import 'di/service_locator.dart';
import 'home_screen.dart';

Future<void> main() async {
  final environment = Production();
  await environment.init();
  await initLogger(EnvType.production);
  runApp(const MyApp());
}
