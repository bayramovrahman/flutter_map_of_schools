// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';
import 'package:e_mekdep_school_maps/services/school_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'map_service_state.dart';
part 'map_service_cubit.freezed.dart';

class MapServiceCubit extends Cubit<MapServiceState> {
  final Box<SchoolModel> _schoolsBox;

  MapServiceCubit(this._schoolsBox) : super(const MapServiceState.initial()) {
    _fetchSchools();
  }

  final SchoolService _schoolService = SchoolService();

  Future<void> _fetchSchools() async {
    try {
      emit(const MapServiceState.loading());

      if (_schoolsBox.isNotEmpty) {
        final _schoolsFromHive = _schoolsBox.values.toList();
        emit(MapServiceState.loaded(schools: _schoolsFromHive));
      } else {
        _schoolsBox.clear();
        final schools = await _schoolService.fetchSchools();
        await _schoolsBox.addAll(schools);
        emit(MapServiceState.loaded(schools: schools));
      }
    } catch (e, s) {
      emit(
        MapServiceState.errorMsg(
          errorMsg: 'Serwerde näsazlyk ýüze çykdy! $s',
        ),
      );
    }
  }
}
