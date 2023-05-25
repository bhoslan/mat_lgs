import 'package:flutter/material.dart';
import 'package:mat_lgs/component/custom_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralState extends StatefulWidget {
  const GeneralState({super.key});

  @override
  State<GeneralState> createState() => _GeneralStateState();
}

class _GeneralStateState extends State<GeneralState> {
  final String _generalState = "Genel Durum";
  final Color _cardColor = Colors.amber;
  final double _radius = 10;
  final String _nameSubject = "Çarpanlar Katlar";
  int? trueNumber;
  int? falseNumber = -1;
  double? net = -1.0;
  int? trueNumber2;
  int? falseNumber2 = -1;
  double? net2 = -1.0;

  void setNumbers() async {
    var prefs = await SharedPreferences.getInstance();

    trueNumber = prefs.getInt("true") ?? -1;
    falseNumber = prefs.getInt("false") ?? -1;
    net = prefs.getDouble("net") ?? -1;
    trueNumber2 = prefs.getInt("true2") ?? -1;
    falseNumber2 = prefs.getInt("false2") ?? -1;
    net2 = prefs.getDouble("net2") ?? -1;
    prefs.reload();
    setState(() {});
  }

  @override
  void initState() {
    
    super.initState();
    setNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_generalState),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: _cardColor,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
          child: Container(
            margin: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: ListBody(children: [
                Center(
                  child: Text(
                    _nameSubject,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  children: [
                    const TableRow(
                      children: [
                        TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text("")),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("Doğru", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("Yanlış", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("Net", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                            child: Text(
                          "Çarpan kavramı",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                        )),
                        TableCell(
                            child: Text("$trueNumber",
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        TableCell(
                            child: Text("$falseNumber",
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        TableCell(
                            child:
                                Text("$net", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  children: [
                    const TableRow(
                      children: [
                        TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Text("")),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("Doğru", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("Yanlış", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Text("Net", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                            child: Text(
                          "Ebob-Ekok",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                        )),
                        TableCell(
                            child: Text("$trueNumber2",
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        TableCell(
                            child: Text("$falseNumber2",
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                        TableCell(
                            child: Text("$net2",
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
