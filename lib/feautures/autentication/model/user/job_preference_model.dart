import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class JobPreferenceMode {
  final String? jobRole;
  final String? jobDuration;
  final String? jobType;
  final String? jobLocation;
  JobPreferenceMode({
    this.jobRole,
    this.jobDuration,
    this.jobType,
    this.jobLocation,
  });

  JobPreferenceMode copyWith({
    String? jobRole,
    String? jobDuration,
    String? jobType,
    String? jobLocation,
  }) {
    return JobPreferenceMode(
      jobRole: jobRole ?? this.jobRole,
      jobDuration: jobDuration ?? this.jobDuration,
      jobType: jobType ?? this.jobType,
      jobLocation: jobLocation ?? this.jobLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobRole': jobRole,
      'jobDuration': jobDuration,
      'jobType': jobType,
      'jobLocation': jobLocation,
    };
  }

  factory JobPreferenceMode.fromMap(Map<String, dynamic> map) {
    return JobPreferenceMode(
      jobRole: map['jobRole'] != null ? map['jobRole'] as String : null,
      jobDuration:
          map['jobDuration'] != null ? map['jobDuration'] as String : null,
      jobType: map['jobType'] != null ? map['jobType'] as String : null,
      jobLocation:
          map['jobLocation'] != null ? map['jobLocation'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobPreferenceMode.fromJson(String source) =>
      JobPreferenceMode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JobPreferenceMode(jobRole: $jobRole, jobDuration: $jobDuration, jobType: $jobType, jobLocation: $jobLocation)';
  }

  @override
  bool operator ==(covariant JobPreferenceMode other) {
    if (identical(this, other)) return true;

    return other.jobRole == jobRole &&
        other.jobDuration == jobDuration &&
        other.jobType == jobType &&
        other.jobLocation == jobLocation;
  }

  @override
  int get hashCode {
    return jobRole.hashCode ^
        jobDuration.hashCode ^
        jobType.hashCode ^
        jobLocation.hashCode;
  }
}
