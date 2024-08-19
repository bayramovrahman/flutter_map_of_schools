import 'package:e_mekdep_school_maps/cubits/course_search_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/school_search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map/map_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_school_info/school_info_cubit.dart';

class AppBlocProviders {
  static List<BlocProvider> get providers => [
        BlocProvider<MapCubit>(
          create: (context) => MapCubit(),
        ),
        BlocProvider<MapServiceCubit>(
          create: (context) => MapServiceCubit(),
        ),
        BlocProvider<SchoolInfoCubit>(
          create: (context) => SchoolInfoCubit(),
        ),
        BlocProvider<SchoolSearchCubit>(
          create: (context) => SchoolSearchCubit(),
        ),
        BlocProvider<CourseSearchCubit>(
          create: (context) => CourseSearchCubit(),
        ),
      ];
}
