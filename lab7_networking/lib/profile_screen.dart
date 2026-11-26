import 'package:flutter/material.dart';

import 'random_user.dart';
import 'user_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  /// The exact user shown on the Home screen. Never refetched here.
  final RandomUser user;

  static const String _missing = 'Not available';

  @override
  Widget build(BuildContext context) {

    final locationLines = <_Field>[
      _Field('Street', user.street),
      _Field('City', user.city),
      _Field('State', user.state),
      _Field('Country', user.country),
      _Field('Postcode', user.postcode),
      _Field('Timezone', _timezone()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Center(
                  child: Hero(
                    tag: 'avatar-${user.uuid ?? user.hashCode}',
                    child: UserAvatar(url: user.pictureUrl, size: 140),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user.fullName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF173F2A),
                      ),
                ),
                const SizedBox(height: 20),
                _Section(
                  title: 'Personal',
                  icon: Icons.person_outline,
                  fields: [
                    _Field('Gender', _capitalize(user.gender)),
                    _Field('Date of birth', _formatDate(user.dob)),
                    _Field('Age', user.age?.toString()),
                    _Field('Nationality', user.nationality),
                    _Field('ID name', user.idName),
                    _Field('ID value', user.idValue),
                  ],
                ),
                _Section(
                  title: 'Contact',
                  icon: Icons.contact_phone_outlined,
                  fields: [
                    _Field('Email', user.email),
                    _Field('Phone', user.phone),
                    _Field('Cell', user.cell),
                  ],
                ),
                _Section(
                  title: 'Location',
                  icon: Icons.place_outlined,
                  fields: locationLines,
                ),
                _Section(
                  title: 'Account',
                  icon: Icons.badge_outlined,
                  fields: [
                    _Field('Username', user.username),
                    _Field('UUID', user.uuid),
                    _Field('Registered', _formatDate(user.registered)),
                    _Field(
                      'Years registered',
                      user.registeredYears?.toString(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _timezone() {
    final offset = user.timezoneOffset;
    final description = user.timezoneDescription;
    if (offset == null && description == null) return null;
    if (offset == null) return description;
    if (description == null) return 'UTC$offset';
    return 'UTC$offset – $description';
  }

  static String? _capitalize(String? s) =>
      (s == null || s.isEmpty) ? null : s[0].toUpperCase() + s.substring(1);

  static String? _formatDate(DateTime? d) {
    if (d == null) return null;
    final local = d.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-${two(local.month)}-${two(local.day)}';
  }
}

class _Field {
  const _Field(this.label, this.value);
  final String label;
  final String? value;
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.icon,
    required this.fields,
  });

  final String title;
  final IconData icon;
  final List<_Field> fields;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: scheme.primary.withOpacity(0.15)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: scheme.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: scheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 20),
            for (final f in fields) _FieldRow(field: f),
          ],
        ),
      ),
    );
  }
}

class _FieldRow extends StatelessWidget {
  const _FieldRow({required this.field});

  final _Field field;

  @override
  Widget build(BuildContext context) {
    final hasValue = field.value != null && field.value!.isNotEmpty;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              field.label,
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: SelectableText(
              hasValue ? field.value! : ProfileScreen._missing,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: hasValue ? FontWeight.w600 : FontWeight.normal,
                fontStyle: hasValue ? FontStyle.normal : FontStyle.italic,
                color: hasValue ? null : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}