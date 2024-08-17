import 'package:e_mekdep_school_maps/cubits/cubit_school_info/school_info_cubit.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';
import 'package:e_mekdep_school_maps/routes/routes_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/pages/home_page.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map/map_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';
import 'package:hive_flutter/adapters.dart';

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
      providers: [
        BlocProvider(
          create: (context) => MapCubit(),
        ),
        BlocProvider(
          create: (context) => MapServiceCubit(),
        ),
        BlocProvider(
          create: (context) => SchoolInfoCubit(),
        ),
      ],
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
