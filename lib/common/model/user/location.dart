// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Location {
  final String cityName;
  final String countryName;
  Location({
    required this.cityName,
    required this.countryName,
  });

  Location copyWith({
    String? cityName,
    String? countryName,
  }) {
    return Location(
      cityName: cityName ?? this.cityName,
      countryName: countryName ?? this.countryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cityName': cityName,
      'countryName': countryName,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      cityName: map['cityName'] as String,
      countryName: map['countryName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Location(cityName: $cityName, countryName: $countryName)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.cityName == cityName && other.countryName == countryName;
  }

  @override
  int get hashCode => cityName.hashCode ^ countryName.hashCode;
}
