import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/pages/home_page.dart';
import 'package:e_mekdep_school_maps/core/bloc_providers.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';
import 'package:e_mekdep_school_maps/routes/routes_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SchoolModelAdapter());
  await Hive.openBox<SchoolModel>("schoolsBox");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<String, WidgetBuilder> routes = RoutesPage.routes;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Mekdep',
        onGenerateRoute: (settings) {
          final builder = routes[settings.name!];
          return CupertinoPageRoute(builder: builder!);
        },
        home: const HomePage(),
      ),
    );
  }
}
