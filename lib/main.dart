import 'package:e_mekdep_school_maps/models/school_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/pages/home_page.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map/map_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SchoolModelAdapter());
  final schoolBox = await Hive.openBox<SchoolModel>("schoolsBox");

  runApp(MyApp(schoolsBox: schoolBox,));
}

class MyApp extends StatelessWidget {
  final Box<SchoolModel> schoolsBox;

  const MyApp({super.key, required this.schoolsBox});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapCubit(),
        ),
        BlocProvider(
          create: (context) => MapServiceCubit(schoolsBox),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Mekdep',
        home: HomePage(),
      ),
    );
  }
}
