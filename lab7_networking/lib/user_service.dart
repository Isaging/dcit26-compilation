import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'random_user.dart';

class UserService {
  UserService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static final Uri _endpoint = Uri.parse('https://randomuser.me/api/');

  /// Requests one random user.
  ///
  /// Throws an [Exception] with a human-readable message on any failure
  /// (offline, timeout, bad status code, malformed body).
  Future<RandomUser> fetchUser() async {
    final http.Response response;
    try {
      response = await _client.get(_endpoint).timeout(
            const Duration(seconds: 15),
          );
    } on TimeoutException {
      throw Exception('The request timed out. Please try again.');
    } catch (_) {
      throw Exception('Could not reach the server. Check your connection.');
    }

    // Check the status BEFORE decoding the body.
    if (response.statusCode != 200) {
      throw Exception('Failed to load user (HTTP ${response.statusCode}).');
    }

    try {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>?;
      if (results == null || results.isEmpty) {
        throw const FormatException('No user data returned');
      }
      final user = results.first as Map<String, dynamic>;
      return RandomUser.fromJson(user);
    } on FormatException {
      throw Exception('The server returned unexpected data.');
    } on TypeError {
      throw Exception('The server returned unexpected data.');
    }
  }

  void dispose() => _client.close();
}