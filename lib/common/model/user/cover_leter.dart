// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CoverLetter {
  final String description;
  final String docPath;
  CoverLetter({
    required this.description,
    required this.docPath,
  });

  CoverLetter copyWith({
    String? description,
    String? docPath,
  }) {
    return CoverLetter(
      description: description ?? this.description,
      docPath: docPath ?? this.docPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'docPath': docPath,
    };
  }

  factory CoverLetter.fromMap(Map<String, dynamic> map) {
    return CoverLetter(
      description: map['description'] as String,
      docPath: map['docPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoverLetter.fromJson(String source) =>
      CoverLetter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CoverLetter(description: $description, docPath: $docPath)';

  @override
  bool operator ==(covariant CoverLetter other) {
    if (identical(this, other)) return true;

    return other.description == description && other.docPath == docPath;
  }

  @override
  int get hashCode => description.hashCode ^ docPath.hashCode;
}
