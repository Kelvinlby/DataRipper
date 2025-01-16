import 'package:flutter/material.dart';
import 'package:dataripper/interface/data_processor.dart';


class Home extends StatefulWidget {
  const Home({super.key, required this.path});
  final String path;

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // init here
  }

  @override
  void dispose() {
    // dispose here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataProcessor.readParquet(widget.path);

    return Scaffold(
      body: Center(
        child: Text(widget.path),
      ),
    );
  }
}