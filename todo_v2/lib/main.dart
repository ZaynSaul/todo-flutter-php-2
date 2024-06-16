import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_v2/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(const App());
}
