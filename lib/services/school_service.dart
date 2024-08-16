import 'package:dio/dio.dart';
import 'package:e_mekdep_school_maps/core/map_constants.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';

class SchoolService {
  // Just empty column

  final String _baseUrl = MapConstants.apiUrl;
  final Dio _dio = Dio();

  Future<List<SchoolModel>> fetchSchools() async {
    final response = await _dio.get('$_baseUrl/api/public/schools');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['schools'];
      final schoolData = data.map((school) => SchoolModel.fromMap(school)).toList();
      return (schoolData);
    } else {
      throw Exception('Failed to load schools');
    }
  }

  // Just empty column
}