import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:dataripper/pages/home.dart';


void main(List<String> args) async {
  final formats = ['parquet', 'csv', 'json', 'jsonl', 'ndjson'];

  if (args.length == 1) {
    File file = File(args.first);

    if (await file.exists() && formats.contains(path.extension(args.first))) {
      runApp(MyApp(path: args.first));
    }
    else {
      runApp(const ErrorApp(msg: 'File not exist or file type not supported'));
    }
  }
  else {
    // runApp(const ErrorApp(msg: 'Path to dataset is missing'));
    runApp(MyApp(path: '/mnt/Data/Dataset/GSM8K/train_00000-of-00001.parquet'));
  }
}


class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key, required this.msg});
  final String msg;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(msg),
                actions: [
                  TextButton(
                    onPressed: () {
                      exit(1);
                    },
                    child: const Text('Exit'),
                  ),
                ],
              ),
            );
          });

          return const SizedBox.shrink(); // Render an empty widget
        },
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: Home(path: path),
    );
  }
}
