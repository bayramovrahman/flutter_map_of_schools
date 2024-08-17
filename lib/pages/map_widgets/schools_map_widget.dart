import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/core/map_constants.dart';
import 'package:e_mekdep_school_maps/pages/school_info_page.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_map_service/map_service_cubit.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_school_info/school_info_cubit.dart';

const String _mapUrl = MapConstants.mapUrl;

Widget schoolsMapWidget() {
  return BlocBuilder<MapServiceCubit, MapServiceState>(
    builder: (context, state) => state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (schools, zoom) {
        final List<Marker> markers = schools.where((school) {
          return school.isSecondarySchool == true &&
              school.latitude != null &&
              school.longitude != null;
        }).map((school) {
          final double latitude = double.parse(school.latitude.toString());
          final double longitude = double.parse(school.longitude.toString());

          return Marker(
            point: LatLng(latitude, longitude),
            width: 80,
            height: 80,
            rotate: true,
            child: Column(
              children: [
                if (zoom > 13.5)
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
                    context
                        .read<SchoolInfoCubit>()
                        .fetchInfoSchool(schools: [school]);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SchoolInfoPage(),
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
            initialZoom: zoom,
            onPositionChanged: (camera, hasGesture) {
              context.read<MapServiceCubit>().updateZoom(camera.zoom);
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
    ),
  );
}
