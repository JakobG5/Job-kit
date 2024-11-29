import 'dart:convert';
import 'package:job_kit/feautures/autentication/model/user/application_model.dart';
import 'package:job_kit/feautures/autentication/model/user/job_preference_model.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final JobPreferenceMode? jobReference;
  final String image;
  final ApplicationModel jobApplication;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.jobReference,
    required this.image,
    required this.jobApplication,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    JobPreferenceMode? jobReference,
    String? image,
    ApplicationModel? jobApplication,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      jobReference: jobReference ?? this.jobReference,
      image: image ?? this.image,
      jobApplication: jobApplication ?? this.jobApplication,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'jobReference': jobReference?.toMap(),
      'image': image,
      'jobApplication': jobApplication.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      jobReference: map['jobReference'] != null
          ? JobPreferenceMode.fromMap(
              map['jobReference'] as Map<String, dynamic>)
          : null,
      image: map['image'] as String,
      jobApplication: ApplicationModel.fromMap(
          map['jobApplication'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, jobReference: $jobReference, image: $image, jobApplication: $jobApplication)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.jobReference == jobReference &&
        other.image == image &&
        other.jobApplication == jobApplication;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        jobReference.hashCode ^
        image.hashCode ^
        jobApplication.hashCode;
  }
}
