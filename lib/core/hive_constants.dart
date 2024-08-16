import 'package:hive/hive.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';

class HiveContants {
  static Box<SchoolModel> schoolsBox = Hive.box<SchoolModel>("schoolsBox");
}