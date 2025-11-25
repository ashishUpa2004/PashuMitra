import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/theme/app_theme.dart';
import 'presentation/widgets/root_router.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: PashuMitraApp()));
}

class PashuMitraApp extends StatelessWidget {
  const PashuMitraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PashuMitra',
      theme: AppTheme.lightTheme,
      home: const RootRouter(), // single entry point that handles auth/profile routing
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
