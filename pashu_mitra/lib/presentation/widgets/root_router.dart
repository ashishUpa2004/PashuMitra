import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pashu_mitra/presentation/providers/auth_provider.dart';
import 'package:pashu_mitra/presentation/providers/farm_profile_check_provider.dart';
import 'package:pashu_mitra/presentation/pages/auth/login_page.dart';
import 'package:pashu_mitra/presentation/pages/farm/farm_profile_page.dart';
import 'package:pashu_mitra/presentation/pages/home/home_page.dart';

class RootRouter extends ConsumerWidget {
  const RootRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          return const LoginPage();
        }

        final profileState = ref.watch(farmProfileCheckProvider);

        return profileState.when(
          data: (exists) => exists ? const HomePage() : const FarmProfilePage(),
          loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (_, __) => const LoginPage(),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, __) => const LoginPage(),
    );
  }
}
