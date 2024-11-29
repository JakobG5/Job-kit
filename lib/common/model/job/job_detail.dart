// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../user/string.dart';

class JobDetail {
  final String header;
  final List<StringList> points;
  JobDetail({
    required this.header,
    required this.points,
  });

  JobDetail copyWith({
    String? header,
    List<StringList>? points,
  }) {
    return JobDetail(
      header: header ?? this.header,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header,
      'points': points.map((x) => x.toMap()).toList(),
    };
  }

  factory JobDetail.fromMap(Map<String, dynamic> map) {
    return JobDetail(
      header: map['header'] as String,
      points: List<StringList>.from(
        (map['points'] as List<int>).map<StringList>(
          (x) => StringList.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory JobDetail.fromJson(String source) =>
      JobDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JobDetail(header: $header, points: $points)';

  @override
  bool operator ==(covariant JobDetail other) {
    if (identical(this, other)) return true;

    return other.header == header && listEquals(other.points, points);
  }

  @override
  int get hashCode => header.hashCode ^ points.hashCode;
}
