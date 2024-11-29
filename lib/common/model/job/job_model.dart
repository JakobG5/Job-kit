// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: depend_on_referenced_packages

import 'package:job_kit/common/model/job/job_detail.dart';
import 'package:job_kit/common/model/user/location.dart';

import '../user/string.dart';

class JobModel {
  final String id;
  final String imagePath;
  final String positionTitile;
  final String componyNamee;
  final String field;
  final String duration;
  final String employeeType;
  final String salary;
  final Location location;
  final String jobDescription;
  final JobDetail jobRequirements;
  final String about;

  final String startDate;
  final String endDate;

  JobModel({
    required this.id,
    required this.imagePath,
    required this.positionTitile,
    required this.componyNamee,
    required this.field,
    required this.duration,
    required this.employeeType,
    required this.salary,
    required this.location,
    required this.jobDescription,
    required this.jobRequirements,
    required this.about,
    required this.startDate,
    required this.endDate,
  });

  JobModel copyWith({
    String? id,
    String? imagePath,
    String? positionTitile,
    String? componyNamee,
    String? field,
    String? duration,
    String? employeeType,
    String? salary,
    Location? location,
    String? jobDescription,
    JobDetail? jobRequirements,
    String? about,
    List<StringList>? reviews,
    String? startDate,
    String? endDate,
    List<StringList>? applplicants,
  }) {
    return JobModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      positionTitile: positionTitile ?? this.positionTitile,
      componyNamee: componyNamee ?? this.componyNamee,
      field: field ?? this.field,
      duration: duration ?? this.duration,
      employeeType: employeeType ?? this.employeeType,
      salary: salary ?? this.salary,
      location: location ?? this.location,
      jobDescription: jobDescription ?? this.jobDescription,
      jobRequirements: jobRequirements ?? this.jobRequirements,
      about: about ?? this.about,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imagePath': imagePath,
      'positionTitile': positionTitile,
      'componyNamee': componyNamee,
      'field': field,
      'duration': duration,
      'employeeType': employeeType,
      'salary': salary,
      'location': location.toMap(),
      'jobDescription': jobDescription,
      'jobRequirements': jobRequirements.toMap(),
      'about': about,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'] as String,
      imagePath: map['imagePath'] as String,
      positionTitile: map['positionTitile'] as String,
      componyNamee: map['componyNamee'] as String,
      field: map['field'] as String,
      duration: map['duration'] as String,
      employeeType: map['employeeType'] as String,
      salary: map['salary'] as String,
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      jobDescription: map['jobDescription'] as String,
      jobRequirements:
          JobDetail.fromMap(map['jobRequirements'] as Map<String, dynamic>),
      about: map['about'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JobModel(id: $id, imagePath: $imagePath, positionTitile: $positionTitile, componyNamee: $componyNamee, field: $field, duration: $duration, employeeType: $employeeType, salary: $salary, location: $location, jobDescription: $jobDescription, jobRequirements: $jobRequirements, about: $about, startDate: $startDate, endDate: $endDate,)';
  }

  @override
  bool operator ==(covariant JobModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imagePath == imagePath &&
        other.positionTitile == positionTitile &&
        other.componyNamee == componyNamee &&
        other.field == field &&
        other.duration == duration &&
        other.employeeType == employeeType &&
        other.salary == salary &&
        other.location == location &&
        other.jobDescription == jobDescription &&
        other.jobRequirements == jobRequirements &&
        other.about == about &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imagePath.hashCode ^
        positionTitile.hashCode ^
        componyNamee.hashCode ^
        field.hashCode ^
        duration.hashCode ^
        employeeType.hashCode ^
        salary.hashCode ^
        location.hashCode ^
        jobDescription.hashCode ^
        jobRequirements.hashCode ^
        about.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
