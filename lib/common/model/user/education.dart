// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Education {
  final String title;
  final String inistitutionName;
  final String startDate;
  final String endDate;
  Education({
    required this.title,
    required this.inistitutionName,
    required this.startDate,
    required this.endDate,
  });

  Education copyWith({
    String? title,
    String? inistitutionName,
    String? startDate,
    String? endDate,
  }) {
    return Education(
      title: title ?? this.title,
      inistitutionName: inistitutionName ?? this.inistitutionName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'inistitutionName': inistitutionName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      title: map['title'] as String,
      inistitutionName: map['inistitutionName'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Education(title: $title, inistitutionName: $inistitutionName, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant Education other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.inistitutionName == inistitutionName &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        inistitutionName.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
