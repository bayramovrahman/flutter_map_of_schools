import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState.initial());

  void updateMarkers({required int index}) {
    emit(MapState.indexWidget(index: index));
  }
}
