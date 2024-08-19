import 'package:flutter/material.dart';

AppBar appBarWidget() {
  return AppBar(
    backgroundColor: Colors.blue,
    title: const Text(
      'E-Mekdep',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    automaticallyImplyLeading: false,
    centerTitle: true,
  );
}
