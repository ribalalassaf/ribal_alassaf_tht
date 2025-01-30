import 'package:flutter/material.dart';
import 'package:ribal_alassaf_tht/config/injectable.dart';
import 'package:ribal_alassaf_tht/config/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouter router;
  @override
  void initState() {
    router = AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      title: 'Enpal THT',
    );
  }
}
