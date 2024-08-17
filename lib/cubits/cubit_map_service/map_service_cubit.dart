// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_mekdep_school_maps/core/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';
import 'package:e_mekdep_school_maps/services/school_service.dart';

part 'map_service_state.dart';
part 'map_service_cubit.freezed.dart';

class MapServiceCubit extends Cubit<MapServiceState> {

  MapServiceCubit() : super(const MapServiceState.loading()) {
    fetchSchools();
  }

  final Box<SchoolModel> _schoolsBox = HiveContants.schoolsBox;
  final SchoolService _schoolService = SchoolService();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  double _currentZoom = 10.0;

  Future<void> fetchSchools() async {
    connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (event) async {
        if (event.contains((ConnectivityResult.none))) {
          if (_schoolsBox.isNotEmpty) {
            final _schoolsFromHive = _schoolsBox.values.toList();
            emit(MapServiceState.loaded(schools: _schoolsFromHive, zoom: _currentZoom));
          } else {
            emit(
              const MapServiceState.errorMsg(
                errorMsg: "Internet birikmesi ýok",
              ),
            );
          }
        } else {
          _schoolsBox.clear();
          final _fetchSchools = await _schoolService.fetchSchools();
          await _schoolsBox.addAll(_fetchSchools);
          emit(MapServiceState.loaded(schools: _fetchSchools, zoom: _currentZoom));
        }
      },
    );
  }

  void updateZoom(double zoom) {
    _currentZoom = zoom;
    emit(MapServiceState.loaded(schools: (state as _Loaded).schools, zoom: zoom));
  }

  double get currentZoom => _currentZoom;
}
