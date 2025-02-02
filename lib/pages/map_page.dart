import 'package:e_mekdep_school_maps/pages/map_widgets/courses_map_widget.dart';
import 'package:e_mekdep_school_maps/pages/map_widgets/schools_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map/map_cubit.dart';

class SchoolMapPage extends StatelessWidget {
  const SchoolMapPage({super.key});

  // Just empty column
  @override
  Widget build(BuildContext context) {
    return context.watch<MapCubit>().state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          indexWidget: (index) {
            if (index == 0) {
              return schoolsMapWidget();
            } else {
              return courseMapWidget();
            }
          },
          errorMsg: (errorMsg) => Center(
            child: Text("Näsazlyk ýüze çykdy: $errorMsg"),
          ),
        );
  }
}
