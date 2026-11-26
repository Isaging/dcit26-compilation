/// Typed model for one entry of `results[]` from https://randomuser.me/api/.
///
/// Every field is nullable (or has a safe default) because the API does not
/// guarantee that every value is populated. Credential fields (password, salt,
/// md5, sha1, sha256) are deliberately NOT parsed.
class RandomUser {
  final String? gender;
  final String? title;
  final String? firstName;
  final String? lastName;

  final String? streetNumber;
  final String? streetName;
  final String? city;
  final String? state;
  final String? country;
  final String? postcode;
  final String? timezoneOffset;
  final String? timezoneDescription;

  final String? email;

  final DateTime? dob;
  final int? age;

  final DateTime? registered;
  final int? registeredYears;

  final String? phone;
  final String? cell;

  final String? idName;
  final String? idValue;

  final String? nationality;

  final String? pictureLarge;
  final String? pictureMedium;
  final String? pictureThumbnail;

  final String? username;
  final String? uuid;

  const RandomUser({
    this.gender,
    this.title,
    this.firstName,
    this.lastName,
    this.streetNumber,
    this.streetName,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.timezoneOffset,
    this.timezoneDescription,
    this.email,
    this.dob,
    this.age,
    this.registered,
    this.registeredYears,
    this.phone,
    this.cell,
    this.idName,
    this.idValue,
    this.nationality,
    this.pictureLarge,
    this.pictureMedium,
    this.pictureThumbnail,
    this.username,
    this.uuid,
  });

  factory RandomUser.fromJson(Map<String, dynamic> json) {
    final name = _map(json['name']);
    final location = _map(json['location']);
    final street = _map(location['street']);
    final timezone = _map(location['timezone']);
    final dob = _map(json['dob']);
    final registered = _map(json['registered']);
    final id = _map(json['id']);
    final picture = _map(json['picture']);
    final login = _map(json['login']); // only username + uuid are read

    return RandomUser(
      gender: _str(json['gender']),
      title: _str(name['title']),
      firstName: _str(name['first']),
      lastName: _str(name['last']),
      streetNumber: _str(street['number']),
      streetName: _str(street['name']),
      city: _str(location['city']),
      state: _str(location['state']),
      country: _str(location['country']),
      postcode: _str(location['postcode']), // may be int or String in the API
      timezoneOffset: _str(timezone['offset']),
      timezoneDescription: _str(timezone['description']),
      email: _str(json['email']),
      dob: _date(dob['date']),
      age: _int(dob['age']),
      registered: _date(registered['date']),
      registeredYears: _int(registered['age']),
      phone: _str(json['phone']),
      cell: _str(json['cell']),
      idName: _str(id['name']),
      idValue: _str(id['value']),
      nationality: _str(json['nat']),
      pictureLarge: _str(picture['large']),
      pictureMedium: _str(picture['medium']),
      pictureThumbnail: _str(picture['thumbnail']),
      username: _str(login['username']),
      uuid: _str(login['uuid']),
    );
  }

  /// "Ms Jane Doe", skipping any missing parts.
  String get fullName {
    final parts = [title, firstName, lastName]
        .whereType<String>()
        .where((p) => p.isNotEmpty)
        .toList();
    return parts.isEmpty ? 'Unknown user' : parts.join(' ');
  }

  /// "Jane Doe" (no title) for the compact home card.
  String get displayName {
    final parts = [firstName, lastName]
        .whereType<String>()
        .where((p) => p.isNotEmpty)
        .toList();
    return parts.isEmpty ? 'Unknown user' : parts.join(' ');
  }

  String? get street {
    final parts = [streetNumber, streetName]
        .whereType<String>()
        .where((p) => p.isNotEmpty)
        .toList();
    return parts.isEmpty ? null : parts.join(' ');
  }

  /// Best available image URL (large preferred).
  String? get pictureUrl => pictureLarge ?? pictureMedium ?? pictureThumbnail;

  // ---- parsing helpers -----------------------------------------------------

  static Map<String, dynamic> _map(Object? value) =>
      value is Map<String, dynamic> ? value : const <String, dynamic>{};

  static String? _str(Object? value) {
    if (value == null) return null;
    final s = value.toString().trim();
    return s.isEmpty ? null : s;
  }

  static int? _int(Object? value) {
    if (value is int) return value;
    return int.tryParse(value?.toString() ?? '');
  }

  static DateTime? _date(Object? value) =>
      value == null ? null : DateTime.tryParse(value.toString());
}