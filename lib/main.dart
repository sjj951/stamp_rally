import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import '../database/database_helper.dart';

import 'package:provider/provider.dart';

// cspell:ignore viewmodels
import 'viewmodels/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseHelper.instance.database;

  //await DatabaseHelper.instance.insertTestData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: MaterialApp(title: 'Stamp Rally', home: const HomePage()),
    );
  }
}
