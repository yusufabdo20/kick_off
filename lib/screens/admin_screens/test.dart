import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Age')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('John')),
          DataCell(Text('25')),
        ]),
        DataRow(cells: [
          DataCell(Text('Jane')),
          DataCell(Text('30')),
        ]),
        DataRow(cells: [
          DataCell(Text('Bob')),
          DataCell(Text('45')),
        ]),
      ],
    ),
    );
  }
}