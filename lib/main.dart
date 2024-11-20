import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/color_provider.dart';
import 'widgets/color_configuration_section.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGB Color Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('RGB Color Picker Lab 11')),
        body: ColorConfigurationSection(),
      ),
    );
  }
}
