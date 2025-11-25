import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pashu_mitra/core/theme/app_theme.dart';
import 'package:pashu_mitra/presentation/pages/farm/farm_profile_page.dart';
import 'package:pashu_mitra/presentation/providers/auth_provider.dart';


class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});
  @override ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();
  bool loading = false;

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => loading = true);
    try {
      await ref.read(authRepositoryProvider).signUp(email.text.trim(), pass.text.trim());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FarmProfilePage()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed: $e')));
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(key: _formKey, child: Column(children: [
            const Text('Create your Account', style: TextStyle(fontSize:26, fontWeight: FontWeight.bold)),
            const SizedBox(height:8),
            TextFormField(controller: email, decoration: const InputDecoration(hintText:'Email', prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))), validator: (v)=> v!.isEmpty ? 'Enter email': null),
            const SizedBox(height:12),
            TextFormField(controller: pass, obscureText: true, decoration: const InputDecoration(hintText:'Password', prefixIcon: Icon(Icons.lock_outline), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))), validator: (v)=> v!.length < 6 ? 'Min 6 chars' : null),
            const SizedBox(height:20),
            ElevatedButton(onPressed: loading ? null : _signup, style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, minimumSize: const Size(double.infinity,55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Sign Up', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)))
          ])),
        ),
      ),
    );
  }
}
