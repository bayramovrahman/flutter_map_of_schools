// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

class GeneralSchoolModel {
  final General? general;
  GeneralSchoolModel({
    this.general,
  });


  GeneralSchoolModel copyWith({
    General? general,
  }) {
    return GeneralSchoolModel(
      general: general ?? this.general,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'general': general?.toMap(),
    };
  }

  factory GeneralSchoolModel.fromMap(Map<String, dynamic> map) {
    return GeneralSchoolModel(
      general: map['general'] != null ? General.fromMap(map['general'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralSchoolModel.fromJson(String source) => GeneralSchoolModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeneralSchoolModel(general: $general)';

  @override
  bool operator ==(covariant GeneralSchoolModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.general == general;
  }

  @override
  int get hashCode => general.hashCode;
}

class General {
  final List<ApiInstance>? apiInstances;
  General({
    this.apiInstances,
  });

  General copyWith({
    List<ApiInstance>? apiInstances,
  }) {
    return General(
      apiInstances: apiInstances ?? this.apiInstances,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiInstances': apiInstances!.map((x) => x.toMap()).toList(),
    };
  }

  factory General.fromMap(Map<String, dynamic> map) {
    return General(
      apiInstances: map['apiInstances'] != null ? List<ApiInstance>.from((map['apiInstances'] as List<int>).map<ApiInstance?>((x) => ApiInstance.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory General.fromJson(String source) => General.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'General(apiInstances: $apiInstances)';

  @override
  bool operator ==(covariant General other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.apiInstances, apiInstances);
  }

  @override
  int get hashCode => apiInstances.hashCode;
}

class ApiInstance {
  final String? code;
  final String? name;
  final String? url;

  ApiInstance({
    this.code,
    this.name,
    this.url,
  });

  ApiInstance copyWith({
    String? code,
    String? name,
    String? url,
  }) {
    return ApiInstance(
      code: code ?? this.code,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'url': url,
    };
  }

  factory ApiInstance.fromMap(Map<String, dynamic> map) {
    return ApiInstance(
      code: map['code'] != null ? map['code'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiInstance.fromJson(String source) => ApiInstance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiInstance(code: $code, name: $name, url: $url)';

  @override
  bool operator ==(covariant ApiInstance other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.name == name &&
      other.url == url;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ url.hashCode;
}
