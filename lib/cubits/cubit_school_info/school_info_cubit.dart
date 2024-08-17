import 'package:bloc/bloc.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_info_state.dart';
part 'school_info_cubit.freezed.dart';

class SchoolInfoCubit extends Cubit<SchoolInfoState> {
  SchoolInfoCubit() : super(const SchoolInfoState.loading());

  void fetchInfoSchool({required List<SchoolModel> schools}) {
    emit(SchoolInfoState.loaded(schoolInfo: schools));
  }
}
