// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WorkExpriance {
  final String positionTitle;
  final String componyName;
  final String description;
  final String startDate;
  final String endDate;
  WorkExpriance({
    required this.positionTitle,
    required this.componyName,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  WorkExpriance copyWith({
    String? positionTitle,
    String? componyName,
    String? description,
    String? startDate,
    String? endDate,
  }) {
    return WorkExpriance(
      positionTitle: positionTitle ?? this.positionTitle,
      componyName: componyName ?? this.componyName,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'positionTitle': positionTitle,
      'componyName': componyName,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory WorkExpriance.fromMap(Map<String, dynamic> map) {
    return WorkExpriance(
      positionTitle: map['positionTitle'] as String,
      componyName: map['componyName'] as String,
      description: map['description'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkExpriance.fromJson(String source) =>
      WorkExpriance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorkExpriance(positionTitle: $positionTitle, componyName: $componyName, description: $description, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant WorkExpriance other) {
    if (identical(this, other)) return true;

    return other.positionTitle == positionTitle &&
        other.componyName == componyName &&
        other.description == description &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return positionTitle.hashCode ^
        componyName.hashCode ^
        description.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
