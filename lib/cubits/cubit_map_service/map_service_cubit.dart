import 'package:bloc/bloc.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';
import 'package:e_mekdep_school_maps/services/school_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_service_state.dart';
part 'map_service_cubit.freezed.dart';

class MapServiceCubit extends Cubit<MapServiceState> {
  MapServiceCubit() : super(const MapServiceState.initial()) {
    _fetchSchools();
  }

  final SchoolService _schoolService = SchoolService();

  Future<void> _fetchSchools() async {
    try {
      emit(const MapServiceState.loading());
      final schools = await _schoolService.fetchSchools();
      emit(MapServiceState.loaded(schools: schools));
    } catch (e,s) {
      emit(
         MapServiceState.errorMsg(
          errorMsg: 'Serwerde näsazlyk ýüze çykdy! $s',
        ),
      );
    }
  }
}
