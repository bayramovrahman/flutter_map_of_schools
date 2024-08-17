part of 'map_service_cubit.dart';

@freezed
class MapServiceState with _$MapServiceState {
  const factory MapServiceState.loading() = _Loading;
  const factory MapServiceState.loaded({required List<SchoolModel> schools, required double zoom,}) = _Loaded;
  const factory MapServiceState.errorMsg({String? errorMsg}) = _ErrorMsg;
}
