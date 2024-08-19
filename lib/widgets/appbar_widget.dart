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
    actions: [
      IconButton(
        iconSize: 28.0,
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ],
    iconTheme: const IconThemeData(color: Colors.white),
    automaticallyImplyLeading: false,
    centerTitle: true,
  );
}
