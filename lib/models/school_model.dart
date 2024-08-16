// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SchoolModel {
  final String? id;
  final String? code;
  final String? name;
  final String? fullName;
  final dynamic description;
  final String? address;
  final String? avatar;
  final dynamic background;
  final String? phone;
  final dynamic email;
  final String? level;
  final dynamic galleries;
  final String? latitude;
  final String? longitude;
  final bool? isDigitalized;
  final bool? isSecondarySchool;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final dynamic archivedAt;
  final int? timetablesCount;
  final int? classroomsCount;
  final dynamic parent;
  final dynamic admin;
  final dynamic specialist;

  SchoolModel({
    this.id,
    this.code,
    this.name,
    this.fullName,
    required this.description,
    this.address,
    this.avatar,
    required this.background,
    this.phone,
    required this.email,
    this.level,
    required this.galleries,
    this.latitude,
    this.longitude,
    this.isDigitalized,
    this.isSecondarySchool,
    this.updatedAt,
    this.createdAt,
    required this.archivedAt,
    this.timetablesCount,
    this.classroomsCount,
    required this.parent,
    required this.admin,
    required this.specialist,
  });

  SchoolModel copyWith({
    String? id,
    String? code,
    String? name,
    String? fullName,
    dynamic description,
    String? address,
    String? avatar,
    dynamic background,
    String? phone,
    dynamic email,
    String? level,
    dynamic galleries,
    String? latitude,
    String? longitude,
    bool? isDigitalized,
    bool? isSecondarySchool,
    DateTime? updatedAt,
    DateTime? createdAt,
    dynamic archivedAt,
    int? timetablesCount,
    int? classroomsCount,
    dynamic parent,
    dynamic admin,
    dynamic specialist,
  }) {
    return SchoolModel(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      description: description ?? this.description,
      address: address ?? this.address,
      avatar: avatar ?? this.avatar,
      background: background ?? this.background,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      level: level ?? this.level,
      galleries: galleries ?? this.galleries,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isDigitalized: isDigitalized ?? this.isDigitalized,
      isSecondarySchool: isSecondarySchool ?? this.isSecondarySchool,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      archivedAt: archivedAt ?? this.archivedAt,
      timetablesCount: timetablesCount ?? this.timetablesCount,
      classroomsCount: classroomsCount ?? this.classroomsCount,
      parent: parent ?? this.parent,
      admin: admin ?? this.admin,
      specialist: specialist ?? this.specialist,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'fullName': fullName,
      'description': description,
      'address': address,
      'avatar': avatar,
      'background': background,
      'phone': phone,
      'email': email,
      'level': level,
      'galleries': galleries,
      'latitude': latitude,
      'longitude': longitude,
      'isDigitalized': isDigitalized,
      'isSecondarySchool': isSecondarySchool,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'archivedAt': archivedAt,
      'timetablesCount': timetablesCount,
      'classroomsCount': classroomsCount,
      'parent': parent,
      'admin': admin,
      'specialist': specialist,
    };
  }

  factory SchoolModel.fromMap(Map<String, dynamic> map) {
    return SchoolModel(
      id: map['id'] != null ? map['id'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      fullName: map['full_name'] != null ? map['full_name'] as String : null,
      description: map['description'] as dynamic,
      address: map['address'] != null ? map['address'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      background: map['background'] as dynamic,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      level: map['level'] != null ? map['level'] as String : null,
      galleries: map['galleries'] as dynamic,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
      isDigitalized: map['is_digitalized'] != null ? map['is_digitalized'] as bool : null,
      isSecondarySchool: map['is_secondary_school'] != null ? map['is_secondary_school'] as bool : null,
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int) : null,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int) : null,
      archivedAt: map['archivedAt'] as dynamic,
      timetablesCount: map['timetablesCount'] != null ? map['timetablesCount'] as int : null,
      classroomsCount: map['classroomsCount'] != null ? map['classroomsCount'] as int : null,
      parent: map['parent'] as dynamic,
      admin: map['admin'] as dynamic,
      specialist: map['specialist'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolModel.fromJson(String source) => SchoolModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SchoolModel(id: $id, code: $code, name: $name, fullName: $fullName, description: $description, address: $address, avatar: $avatar, background: $background, phone: $phone, email: $email, level: $level, galleries: $galleries, latitude: $latitude, longitude: $longitude, isDigitalized: $isDigitalized, isSecondarySchool: $isSecondarySchool, updatedAt: $updatedAt, createdAt: $createdAt, archivedAt: $archivedAt, timetablesCount: $timetablesCount, classroomsCount: $classroomsCount, parent: $parent, admin: $admin, specialist: $specialist)';
  }

  @override
  bool operator ==(covariant SchoolModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.code == code &&
      other.name == name &&
      other.fullName == fullName &&
      other.description == description &&
      other.address == address &&
      other.avatar == avatar &&
      other.background == background &&
      other.phone == phone &&
      other.email == email &&
      other.level == level &&
      other.galleries == galleries &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.isDigitalized == isDigitalized &&
      other.isSecondarySchool == isSecondarySchool &&
      other.updatedAt == updatedAt &&
      other.createdAt == createdAt &&
      other.archivedAt == archivedAt &&
      other.timetablesCount == timetablesCount &&
      other.classroomsCount == classroomsCount &&
      other.parent == parent &&
      other.admin == admin &&
      other.specialist == specialist;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      code.hashCode ^
      name.hashCode ^
      fullName.hashCode ^
      description.hashCode ^
      address.hashCode ^
      avatar.hashCode ^
      background.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      level.hashCode ^
      galleries.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      isDigitalized.hashCode ^
      isSecondarySchool.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      archivedAt.hashCode ^
      timetablesCount.hashCode ^
      classroomsCount.hashCode ^
      parent.hashCode ^
      admin.hashCode ^
      specialist.hashCode;
  }
}
