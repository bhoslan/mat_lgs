import 'package:flutter/material.dart';
import 'package:mat_lgs/viewmodels.dart/user_viewmodel.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class HomePage extends StatefulWidget {
  final MyUser myUser;
  const HomePage({super.key, required this.myUser});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Text("Hoşgeldiniz ${widget.myUser.myUserId}"),
      ),
    );
  }
}
