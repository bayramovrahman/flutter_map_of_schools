import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';
import 'package:e_mekdep_school_maps/pages/school_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:e_mekdep_school_maps/core/map_constants.dart';

class SchoolsMapWidget extends StatefulWidget {
  const SchoolsMapWidget({super.key});

  @override
  State<SchoolsMapWidget> createState() => _SchoolsMapWidgetState();
}

class _SchoolsMapWidgetState extends State<SchoolsMapWidget> {
  // Just emtpy column

  final String _mapUrl = MapConstants.mapUrl;
  double _currentZoom = 10.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapServiceCubit, MapServiceState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (schools) {
            final List<Marker> markers = schools.where((school) {
              return school.isSecondarySchool == true &&
                  school.latitude != null &&
                  school.longitude != null;
            }).map((school) {
              final double latitude = double.parse(school.latitude.toString());
              final double longitude =
                  double.parse(school.longitude.toString());

              return Marker(
                point: LatLng(latitude, longitude),
                width: 80,
                height: 80,
                rotate: true,
                child: Column(
                  children: [
                    if (_currentZoom > 13.5)
                      Expanded(
                        child: Text(
                          school.name.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    GestureDetector(
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
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              );
            }).toList();

            return FlutterMap(
              options: MapOptions(
                initialCenter: const LatLng(37.9800691, 58.2612141),
                initialZoom: 10,
                onPositionChanged: (camera, hasGesture) {
                  setState(() {
                    _currentZoom = camera.zoom;
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: '$_mapUrl/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: markers,
                ),
              ],
            );
          },
          errorMsg: (errorMsg) => Center(child: Text(errorMsg.toString())),
        );
      },
    );
  }
}
