import 'dart:convert';

class NameModel {
  final String first;
  final String middle;
  final String last;
  NameModel({
    required this.first,
    required this.middle,
    required this.last,
  });

  NameModel copyWith({
    String? first,
    String? middle,
    String? last,
  }) {
    return NameModel(
      first: first ?? this.first,
      middle: middle ?? this.middle,
      last: last ?? this.last,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first': first,
      'middle': middle,
      'last': last,
    };
  }

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      first: map['first'] as String,
      middle: map['middle'] as String,
      last: map['last'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NameModel.fromJson(String source) =>
      NameModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NameModel(first: $first, middle: $middle, last: $last)';

  @override
  bool operator ==(covariant NameModel other) {
    if (identical(this, other)) return true;

    return other.first == first && other.middle == middle && other.last == last;
  }

  @override
  int get hashCode => first.hashCode ^ middle.hashCode ^ last.hashCode;
}
