import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/utilities/shimmer_util.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_school_info/school_info_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';

class CourseCenterPage extends StatelessWidget {
  const CourseCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<MapServiceCubit>().state.when(
          loading: () => ShimmerUtils.shimmerListTile(),
          loaded: (schools, zoom) {
            final filteredCourse = schools
                .where((school) => school.isSecondarySchool == false)
                .toList();
            return RefreshIndicator(
              child: ListView.builder(
                itemCount: filteredCourse.length,
                itemBuilder: (context, index) {
                  final courseCenter = filteredCourse[index];
                  return Card(
                    margin: const EdgeInsets.all(3.0),
                    child: ListTile(
                      title: Text(courseCenter.name.toString()),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        context.read<SchoolInfoCubit>().fetchInfoSchool(schools: [courseCenter]);
                        Navigator.pushNamed(context, 'schoolInfoPage');
                      },
                    ),
                  );
                },
              ),
              onRefresh: () {
                return context.read<MapServiceCubit>().fetchSchools();
              },
            );
          },
          errorMsg: (errorMsg) => Center(child: Text(errorMsg.toString())),
        );
  }
}
