// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StringList {
  final String id;
  final String content;
  StringList({
    required this.id,
    required this.content,
  });

  StringList copyWith({
    String? id,
    String? content,
  }) {
    return StringList(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
    };
  }

  factory StringList.fromMap(Map<String, dynamic> map) {
    return StringList(
      id: map['id'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StringList.fromJson(String source) =>
      StringList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StringList(id: $id, content: $content)';

  @override
  bool operator ==(covariant StringList other) {
    if (identical(this, other)) return true;

    return other.id == id && other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode;
}
