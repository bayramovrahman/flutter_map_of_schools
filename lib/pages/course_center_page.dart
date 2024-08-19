import 'package:e_mekdep_school_maps/cubits/course_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/utilities/shimmer_util.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_school_info/school_info_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';

class CourseCenterPage extends StatefulWidget {
  const CourseCenterPage({super.key});

  @override
  State<CourseCenterPage> createState() => _CourseCenterPageState();
}

class _CourseCenterPageState extends State<CourseCenterPage> {
  @override
  Widget build(BuildContext context) {
    return context.watch<MapServiceCubit>().state.when(
          loading: () => ShimmerUtils.shimmerListTile(),
          loaded: (schools, zoom) {
            return BlocBuilder<CourseSearchCubit, String>(
              builder: (context, state) {
                final filteredCourse = schools
                    .where((school) =>
                        school.isSecondarySchool == false &&
                        school.name!.toLowerCase().contains(state.toLowerCase()))
                    .toList();
                return RefreshIndicator(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 6.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Kurs merkez gözle ...',
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 14.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (value) {
                                  context.read<CourseSearchCubit>().searchInput(value);
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.filter_list,
                                  color: Colors.blue,
                                ),
                                iconSize: 28.0,
                                onPressed: () {},
                                padding: const EdgeInsets.all(12.0),
                                splashColor: Colors.blue.shade100,
                                highlightColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
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
                      ),
                    ],
                  ),
                  onRefresh: () {
                    return context.read<MapServiceCubit>().fetchSchools();
                  },
                );
              },
            );
          },
          errorMsg: (errorMsg) => Center(child: Text(errorMsg.toString())),
        );
  }
}
