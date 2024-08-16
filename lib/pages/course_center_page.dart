import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/pages/school_info_page.dart';
import 'package:e_mekdep_school_maps/utilities/shimmer_util.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';

class CourseCenterPage extends StatelessWidget {
  const CourseCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<MapServiceCubit>().state.when(
          initial: () => ShimmerUtils.shimmerListTile(),
          loading: () => ShimmerUtils.shimmerListTile(),
          loaded: (schools) {
            final filteredSchools = schools
                .where((school) => school.isSecondarySchool == false)
                .toList();
            return RefreshIndicator(
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
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return SchoolInfoScreen(
                                schoolName: school.name.toString(),
                                schoolFullname: school.fullName,
                                schoolAddress: school.address,
                                schoolPhone: school.phone,
                                schoolEmail: school.email,
                                schoolDigitalized: school.isDigitalized,
                                schoolGallery: school.galleries,
                                schoolLatitude: school.latitude,
                                schoolLongitude: school.longitude,
                              );
                            },
                          ),
                        );
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
