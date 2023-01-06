import 'dart:convert';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;

class Sampledatagrid extends StatefulWidget {
  const Sampledatagrid({Key? key}) : super(key: key);

  @override
  State<Sampledatagrid> createState() => _SampledatagridState();
}

class _SampledatagridState extends State<Sampledatagrid> {
  late PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Column1',
      field: 'column_1',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Column2',
      field: 'column_2',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Column3',
      field: 'column_3',
      type: PlutoColumnType.text(),
    ),
  ];

  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'column_1': PlutoCell(value: 'cell 1-1'),
        'column_2': PlutoCell(value: 'cell 1-2'),
        'column_3': PlutoCell(value: 'cell 1-3'),
      },
    ),
    PlutoRow(
      cells: {
        'column_1': PlutoCell(value: 'cell 2-1'),
        'column_2': PlutoCell(value: 'cell 2-2'),
        'column_3': PlutoCell(value: 'cell 2-3'),
      },
    ),
    PlutoRow(
      cells: {
        'column_1': PlutoCell(value: 'cell 3-1'),
        'column_2': PlutoCell(value: 'cell 3-2'),
        'column_3': PlutoCell(value: 'cell 3-3'),
      },
    ),
  ];

  void exportToPdf() async {
    final themeData = pluto_grid_export.ThemeData.withFont(
      base: pluto_grid_export.Font.ttf(
        await rootBundle
            .load('fonts/open_sans/OpenSans-Italic-VariableFont_wdth,wght.ttf'),
      ),
      bold: pluto_grid_export.Font.ttf(
        await rootBundle
            .load('fonts/open_sans/OpenSans-Italic-VariableFont_wdth,wght.ttf'),
      ),
    );

    var plutoGridPdfExport = pluto_grid_export.PlutoGridDefaultPdfExport(
      title: "Pluto Grid Sample pdf print",
      creator: "Pluto Grid Rocks!",
      format: pluto_grid_export.PdfPageFormat.a4.landscape,
      themeData: themeData,
    );

    await pluto_grid_export.

    Printing.sharePdf(
      bytes: await plutoGridPdfExport.export(stateManager),
      filename: plutoGridPdfExport.getFilename(),
    );
  }

  void exportToCsv() async {
    String title = "pluto_grid_export";

    var exported = const Utf8Encoder()
        .convert(pluto_grid_export.PlutoGridExport.exportCSV(stateManager));

    // use file_saver from pub.dev
    await FileSaver.instance.saveFile("$title.csv", exported, ".csv");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6d96fa),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PlutoGrid(
                columns: columns,
                rows: rows,
                onLoaded: (e) {
                  stateManager = e.stateManager;
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Color(0xff6d96fa),
                    onPressed: exportToPdf,
                    child: const Text('Export to PDF'),
                  ),
                  MaterialButton(
                    color: Color(0xff6d96fa),
                    onPressed: exportToCsv,
                    child: const Text('Export to CSV'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
