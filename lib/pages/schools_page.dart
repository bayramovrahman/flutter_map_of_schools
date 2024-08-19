import 'package:e_mekdep_school_maps/cubits/school_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/utilities/shimmer_util.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_school_info/school_info_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';

class SchoolsPage extends StatefulWidget {
  const SchoolsPage({super.key});

  @override
  State<SchoolsPage> createState() => _SchoolsPageState();
}

class _SchoolsPageState extends State<SchoolsPage> {
  //

  String? selectedState;

  final List<String> welayatlar = [
    'Aşgabat şäheri',
    'Arkadag şäheri',
    'Balkan welaýaty',
    'Ahal welaýaty',
    'Mary welaýaty',
    'Lebap welaýaty',
    'Daşoguz welaýaty,'
  ];

  @override
  Widget build(BuildContext context) {
    return context.watch<MapServiceCubit>().state.when(
          loading: () => ShimmerUtils.shimmerListTile(),
          loaded: (schools, zoom) {
            return BlocBuilder<SchoolSearchCubit, String>(
              builder: (context, state) {
                final filteredSchools = schools
                    .where((school) =>
                        school.isSecondarySchool == true &&
                        school.name!.toLowerCase().contains(state.toLowerCase()))
                    .toList();

                return RefreshIndicator(
                  onRefresh: () async {
                    await context.read<MapServiceCubit>().fetchSchools();
                  },
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
                                  hintText: 'Mekdep gözle ...',
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
                                  context.read<SchoolSearchCubit>().searchInput(value);
                                },
                              ),
                            ),
                            const SizedBox(width: 5.0),
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
                                onPressed: () {
                                  _showStateFilterDialog(context);
                                },
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
                                  context
                                      .read<SchoolInfoCubit>()
                                      .fetchInfoSchool(schools: [school]);
                                  Navigator.pushNamed(
                                      context, 'schoolInfoPage');
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          errorMsg: (errorMsg) => Center(child: Text(errorMsg.toString())),
        );
  }

  void _showStateFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Welaýat saýlaň')),
          content: SingleChildScrollView(
            child: Column(
              children: welayatlar.map((state) {
                return RadioListTile<String>(
                  title: Text(state),
                  value: state,
                  groupValue: selectedState,
                  onChanged: (value) {
                    setState(() {
                      selectedState = value;
                    });
                    Navigator.of(context).pop();
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
