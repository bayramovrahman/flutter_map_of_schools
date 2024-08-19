import 'package:flutter_bloc/flutter_bloc.dart';

class CourseSearchCubit extends Cubit<String> {
  CourseSearchCubit() : super('');

  void searchInput(String searchInput) {
    emit(searchInput);
  }
}