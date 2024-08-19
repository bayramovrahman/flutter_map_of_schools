import 'package:e_mekdep_school_maps/core/map_constants.dart';
import 'package:e_mekdep_school_maps/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const String _mapUrl = MapConstants.mapUrl;

class SingleSchoolMapWidget extends StatelessWidget {
  final String schoolName;
  final double latitude;
  final double longitude;

  const SingleSchoolMapWidget({
    super.key,
    required this.schoolName,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(latitude, longitude),
          initialZoom: 18,
        ),
        children: [
          TileLayer(
            urlTemplate: '$_mapUrl/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(latitude, longitude),
                width: 100,
                height: 100,
                rotate: true,
                child: Column(
                  children: [
                    Text(
                      schoolName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.location_on,
                      color: Colors.green,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
