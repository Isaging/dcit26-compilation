import 'package:flutter/material.dart';

import 'random_user.dart';
import 'user_service.dart';
import 'user_avatar.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserService _service = UserService();

  RandomUser? _user;
  String? _error;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadUser(); // one request on init, never inside build()
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  Future<void> _loadUser() async {
    if (_loading) return;
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final user = await _service.fetchUser();
      if (!mounted) return;
      setState(() {
        _user = user;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString().replaceFirst('Exception: ', '');
        _loading = false;
      });
    }
  }

  void _openProfile(RandomUser user) {
    // Pass the exact object currently shown; the profile never refetches.
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => ProfileScreen(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random User',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: _buildBody(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final user = _user;

    // First load: nothing to show yet.
    if (user == null && _loading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading user…'),
          ],
        ),
      );
    }

    // First load failed: full error + retry.
    if (user == null) {
      return _ErrorView(
        message: _error ?? 'Something went wrong.',
        onRetry: _loadUser,
      );
    }

    final scheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tap the picture to open the profile.
        Stack(
          alignment: Alignment.center,
          children: [
            Semantics(
              button: true,
              label: 'Open profile for ${user.displayName}',
              child: GestureDetector(
                onTap: _loading ? null : () => _openProfile(user),
                child: Hero(
                  tag: 'avatar-${user.uuid ?? user.hashCode}',
                  child: UserAvatar(url: user.pictureUrl, size: 160),
                ),
              ),
            ),
            if (_loading)
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.7),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Tap the picture for details',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        Text(
          user.displayName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF173F2A),
              ),
        ),
        const SizedBox(height: 4),
        Text(
          user.email ?? 'No email provided',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 28),
        if (_error != null) ...[
          // A refresh failed but the previous user is still displayed.
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: scheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: scheme.onErrorContainer),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _error!,
                    style: TextStyle(color: scheme.onErrorContainer),
                  ),
                ),
              ],
            ),
          ),
        ],
        FilledButton(
          onPressed: _loading ? null : _loadUser,
          child: Text(
            _error != null ? 'RETRY' : 'NEW USER',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off,
              size: 56, color: Theme.of(context).colorScheme.error),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('RETRY'),
          ),
        ],
      ),
    );
  }
}
