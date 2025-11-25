import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pashu_mitra/core/theme/app_theme.dart';
import 'package:pashu_mitra/presentation/pages/auth/signup_page.dart';
import 'package:pashu_mitra/presentation/providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;

  Future<void> _loginEmail() async {
    setState(() => loading = true);
    try {
      await ref.read(authRepositoryProvider).login(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
      // NO manual navigation. RootRouter/main will react to auth change.
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> _google() async {
    setState(() => loading = true);
    try {
      await ref.read(authRepositoryProvider).googleSignIn();
      // NO manual navigation
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Google sign in failed: $e')));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Icon(Icons.language, size: 18),
                    SizedBox(width: 6),
                    Text('English'),
                    Icon(Icons.keyboard_arrow_down, size: 18),
                  ]),
                ),
              ),
              const SizedBox(height: 60),
              const Text('Welcome to PashuMitra', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
              const SizedBox(height: 8),
              const Text("Manage your farm's biosecurity with ease.", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),
              TextField(controller: emailController, decoration: const InputDecoration(hintText: 'Email', prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))))),
              const SizedBox(height: 12),
              TextField(controller: passwordController, obscureText: true, decoration: const InputDecoration(hintText: 'Password', prefixIcon: Icon(Icons.lock_outline), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))))),
              Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text('Forgot Password?', style: TextStyle(color: AppTheme.primary)))),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: loading ? null : _loginEmail,
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, minimumSize: const Size(double.infinity, 55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupPage())),
                  child: const Text('Register here', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w600)),
                ),
              ]),
              const SizedBox(height: 16),
              Row(children: const [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('Or continue with', style: TextStyle(color: Colors.grey))), Expanded(child: Divider())]),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: loading ? null : _google,
                icon: const Icon(Icons.account_circle, color: Colors.red),
                label: const Text('Google'),
                style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
