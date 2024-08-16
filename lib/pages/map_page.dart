import 'package:e_mekdep_school_maps/pages/map_widgets/courses_map_widget.dart';
import 'package:e_mekdep_school_maps/pages/map_widgets/schools_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map/map_cubit.dart';

class SchoolMapPage extends StatefulWidget {
  const SchoolMapPage({super.key});

  @override
  State<SchoolMapPage> createState() => _SchoolMapPageState();
}

class _SchoolMapPageState extends State<SchoolMapPage> {
  // Just empty column

  // final String _mapUrl = MapConstants.mapUrl;

  @override
  Widget build(BuildContext context) {
    return context.watch<MapCubit>().state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          indexWidget: (index) {
            if (index == 0) {
              return const SchoolsMapWidget();
            } else {
              return const CourseMapWidget();
            }
          },
          errorMsg: (errorMsg) => Center(
            child: Text("Näsazlyk ýüze çykdy: $errorMsg"),
          ),
        );
  }

  // Just empty column
}
