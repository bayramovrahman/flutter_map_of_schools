part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.initial() = _Initial;
  const factory MapState.indexWidget({required int index}) = _IndexWidget;
  const factory MapState.errorMsg({String? errorMsg}) = _ErrorMsg;
}
