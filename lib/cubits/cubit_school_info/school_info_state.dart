part of 'school_info_cubit.dart';

@freezed
class SchoolInfoState with _$SchoolInfoState {
  const factory SchoolInfoState.loading() = _Loading;
  const factory SchoolInfoState.loaded({required List<SchoolModel> schoolInfo}) = _Loaded;
  const factory SchoolInfoState.error({required String errMsg}) = _Error;
}
