// class Address {
//   final String country;
//   final String city;
//   final String district;
//   final String street;

//   Address({
//     required this.country,
//     required this.city,
//     required this.district,
//     required this.street,
//   });
// }

class Address {
  final String country;
  final String city;
  final String district;
  final String street;

  Address({
    required this.country,
    required this.city,
    required this.district,
    required this.street,
  });

  Address copyWith({
    String? country,
    String? city,
    String? district,
    String? street,
  }) {
    return Address(
      country: country ?? this.country,
      city: city ?? this.city,
      district: district ?? this.district,
      street: street ?? this.street,
    );
  }
}
