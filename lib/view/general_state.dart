import 'package:flutter/material.dart';
import 'package:mat_lgs/component/custom_drawer_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_generalState),
      ),
      drawer: CustomDrawer(),
      body: Card(
        color: _cardColor,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
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
            Table(),


            
          ]),
        ),
      ),
    );
  }
}
