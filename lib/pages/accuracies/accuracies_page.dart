import 'package:aishop_admin/widgets/header/page_header.dart';
import 'package:flutter/material.dart';

class AccuraciesPage extends StatefulWidget {
  @override
  _AccuraciesPageState createState() => _AccuraciesPageState();
}

class _AccuraciesPageState extends State<AccuraciesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
          PageHeader(
            text: 'Accuracies',
          ),
        ]));
  }
}
