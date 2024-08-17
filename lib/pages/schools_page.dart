import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/utilities/shimmer_util.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_school_info/school_info_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';

class SchoolsPage extends StatelessWidget {
  const SchoolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<MapServiceCubit>().state.when(
          loading: () => ShimmerUtils.shimmerListTile(),
          loaded: (schools, zoom) {
            final filteredSchools = schools
                .where((school) => school.isSecondarySchool == true)
                .toList();
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<MapServiceCubit>().fetchSchools();
              },
              child: ListView.builder(
                itemCount: filteredSchools.length,
                itemBuilder: (context, index) {
                  final school = filteredSchools[index];
                  return Card(
                    margin: const EdgeInsets.all(3.0),
                    child: ListTile(
                      title: Text(school.name.toString()),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        context.read<SchoolInfoCubit>().fetchInfoSchool(schools: [school]);
                        Navigator.pushNamed(context, 'schoolInfoPage');
                      },
                    ),
                  );
                },
              ),
            );
          },
          errorMsg: (errorMsg) => Center(child: Text(errorMsg.toString())),
        );
  }
}
