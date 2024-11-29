// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Resume {
  final String description;
  final String pdfPath;
  Resume({
    required this.description,
    required this.pdfPath,
  });

  Resume copyWith({
    String? description,
    String? pdfPath,
  }) {
    return Resume(
      description: description ?? this.description,
      pdfPath: pdfPath ?? this.pdfPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'pdfPath': pdfPath,
    };
  }

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      description: map['description'] as String,
      pdfPath: map['pdfPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Resume.fromJson(String source) =>
      Resume.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Resume(description: $description, pdfPath: $pdfPath)';

  @override
  bool operator ==(covariant Resume other) {
    if (identical(this, other)) return true;

    return other.description == description && other.pdfPath == pdfPath;
  }

  @override
  int get hashCode => description.hashCode ^ pdfPath.hashCode;
}
