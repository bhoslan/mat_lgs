import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "OpenSans",
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0, //AppBar'ın arka planını beyaz yapar.
    );
  }
}

//Buna sonradan bakılacak ! 