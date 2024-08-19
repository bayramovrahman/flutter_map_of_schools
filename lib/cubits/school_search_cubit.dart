import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolSearchCubit extends Cubit<String> {
  SchoolSearchCubit() : super('');

  void searchInput(String searchInput) {
    emit(searchInput);
  }
}
