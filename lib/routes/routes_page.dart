import 'package:e_mekdep_school_maps/pages/school_info_page.dart';
import 'package:flutter/material.dart';
import 'package:e_mekdep_school_maps/pages/home_page.dart';

class RoutesPage {
  //

  static final Map<String, WidgetBuilder> routes = {
    'home': (context) => const HomePage(),
    'schoolInfoPage': (context) => const SchoolInfoPage(),
  };

  //
}
