// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApplicationModel {
  final String id;
  final String? jobStatus;
  ApplicationModel({
    required this.id,
    this.jobStatus,
  });

  ApplicationModel copyWith({
    String? id,
    String? jobStatus,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      jobStatus: jobStatus ?? this.jobStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'jobStatus': jobStatus,
    };
  }

  factory ApplicationModel.fromMap(Map<String, dynamic> map) {
    return ApplicationModel(
      id: map['id'] as String,
      jobStatus: map['jobStatus'] != null ? map['jobStatus'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplicationModel.fromJson(String source) =>
      ApplicationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApplicationModel(id: $id, jobStatus: $jobStatus)';

  @override
  bool operator ==(covariant ApplicationModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.jobStatus == jobStatus;
  }

  @override
  int get hashCode => id.hashCode ^ jobStatus.hashCode;
}
