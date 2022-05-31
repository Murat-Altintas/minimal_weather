// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../services/control.dart';

class GridListWidget extends StatefulWidget {
  const GridListWidget({Key? key}) : super(key: key);

  @override
  State<GridListWidget> createState() => GridListWidgetState();
}

class GridListWidgetState extends State<GridListWidget> {
  final _apiListFill = ApiListFillClass();
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Text("test"),
    );
  }
}
