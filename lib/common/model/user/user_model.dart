// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:job_kit/common/model/user/education.dart';
import 'package:job_kit/common/model/user/work_expriance.dart';

import 'location.dart';
import 'name_mode.dart';
import 'string.dart';

class UserModel {
  final String id;
  final NameModel name;
  final String imagePath;
  final Location location;
  final String dateOfBirth;
  final String? email;
  final String? gender;
  final double phoneNumber;
  // final List<Resume>? resume;
  // final List<CoverLetter>? coverLetter;
  // final String? aboutMe;
  final List<WorkExpriance> workExpriance;
  final List<Education> education;
  final List<StringList> skills;
  final List<StringList> language;
  UserModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.location,
    required this.dateOfBirth,
    this.email,
    this.gender,
    required this.phoneNumber,
    required this.workExpriance,
    required this.education,
    required this.skills,
    required this.language,
  });
  // final List<StringList>? jobPosted;
  // final List<StringList>? applicationStatus;

  UserModel copyWith({
    String? id,
    NameModel? name,
    String? imagePath,
    Location? location,
    String? dateOfBirth,
    String? email,
    String? gender,
    double? phoneNumber,
    List<WorkExpriance>? workExpriance,
    List<Education>? education,
    List<StringList>? skills,
    List<StringList>? language,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      location: location ?? this.location,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      workExpriance: workExpriance ?? this.workExpriance,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name.toMap(),
      'imagePath': imagePath,
      'location': location.toMap(),
      'dateOfBirth': dateOfBirth,
      'email': email,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'workExpriance': workExpriance.map((x) => x.toMap()).toList(),
      'education': education.map((x) => x.toMap()).toList(),
      'skills': skills.map((x) => x.toMap()).toList(),
      'language': language.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: NameModel.fromMap(map['name'] as Map<String, dynamic>),
      imagePath: map['imagePath'] as String,
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      dateOfBirth: map['dateOfBirth'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      phoneNumber: map['phoneNumber'] as double,
      workExpriance: List<WorkExpriance>.from(
        (map['workExpriance'] as List<int>).map<WorkExpriance>(
          (x) => WorkExpriance.fromMap(x as Map<String, dynamic>),
        ),
      ),
      education: List<Education>.from(
        (map['education'] as List<int>).map<Education>(
          (x) => Education.fromMap(x as Map<String, dynamic>),
        ),
      ),
      skills: List<StringList>.from(
        (map['skills'] as List<int>).map<StringList>(
          (x) => StringList.fromMap(x as Map<String, dynamic>),
        ),
      ),
      language: List<StringList>.from(
        (map['language'] as List<int>).map<StringList>(
          (x) => StringList.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, imagePath: $imagePath, location: $location, dateOfBirth: $dateOfBirth, email: $email, gender: $gender, phoneNumber: $phoneNumber, workExpriance: $workExpriance, education: $education, skills: $skills, language: $language)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.imagePath == imagePath &&
        other.location == location &&
        other.dateOfBirth == dateOfBirth &&
        other.email == email &&
        other.gender == gender &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.workExpriance, workExpriance) &&
        listEquals(other.education, education) &&
        listEquals(other.skills, skills) &&
        listEquals(other.language, language);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imagePath.hashCode ^
        location.hashCode ^
        dateOfBirth.hashCode ^
        email.hashCode ^
        gender.hashCode ^
        phoneNumber.hashCode ^
        workExpriance.hashCode ^
        education.hashCode ^
        skills.hashCode ^
        language.hashCode;
  }
}
