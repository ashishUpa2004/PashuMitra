import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'presentation/providers/auth_provider.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: PashuMitraApp()));
}

class PashuMitraApp extends ConsumerWidget {
  const PashuMitraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authState = ref.watch(authStateProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PashuMitra',
      theme: AppTheme.lightTheme,
      initialRoute: AppConstants.routeLogin,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

/// If user logged in we check if they already have a farm profile (optional)
class HomeRedirect extends ConsumerWidget {
  const HomeRedirect({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // for simplicity navigate to HomePage; FarmProfilePage can be shown after login if you want.
    Future.microtask(() => Navigator.pushReplacementNamed(context, '/home'));
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
