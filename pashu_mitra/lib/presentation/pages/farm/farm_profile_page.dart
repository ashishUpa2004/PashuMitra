import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FarmProfilePage extends StatefulWidget {
  const FarmProfilePage({super.key});

  @override
  State<FarmProfilePage> createState() => _FarmProfilePageState();
}

class _FarmProfilePageState extends State<FarmProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController farmerNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String? selectedFarmType;
  String? selectedHousingType;
  bool _isSaving = false;

  Future<void> _saveFarmProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      await FirebaseFirestore.instance.collection('farm_profiles').add({
        'farmerName': farmerNameController.text.trim(),
        'farmType': selectedFarmType ?? '',
        'location': locationController.text.trim(),
        'housingType': selectedHousingType ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Farm profile saved successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Wait a bit so snackbar is visible
      await Future.delayed(const Duration(milliseconds: 700));

      // ✅ Use addPostFrameCallback for safe navigation
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/home',
            (route) => false,
          );
        }
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Error saving: $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Farm Profile Setup')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel('Farmer Name'),
                TextFormField(
                  controller: farmerNameController,
                  validator: (v) =>
                      v!.trim().isEmpty ? 'Enter farmer name' : null,
                  decoration: _inputDecoration('Enter Farmer Name'),
                ),
                const SizedBox(height: 16),
                _buildLabel('Farm Type'),
                DropdownButtonFormField<String>(
                  value: selectedFarmType,
                  items: const [
                    DropdownMenuItem(value: 'Poultry', child: Text('Poultry')),
                    DropdownMenuItem(value: 'Dairy', child: Text('Dairy')),
                    DropdownMenuItem(value: 'Pig', child: Text('Pig')),
                  ],
                  onChanged: (v) => setState(() => selectedFarmType = v),
                  validator: (v) => v == null ? 'Select farm type' : null,
                  decoration: _inputDecoration('Select Farm Type'),
                ),
                const SizedBox(height: 16),
                _buildLabel('Location'),
                TextFormField(
                  controller: locationController,
                  validator: (v) =>
                      v!.trim().isEmpty ? 'Enter location' : null,
                  decoration: _inputDecoration('Enter Farm Location'),
                ),
                const SizedBox(height: 16),
                _buildLabel('Housing Type'),
                DropdownButtonFormField<String>(
                  value: selectedHousingType,
                  items: const [
                    DropdownMenuItem(value: 'Indoor', child: Text('Indoor')),
                    DropdownMenuItem(value: 'Outdoor', child: Text('Outdoor')),
                  ],
                  onChanged: (v) => setState(() => selectedHousingType = v),
                  validator: (v) => v == null ? 'Select housing type' : null,
                  decoration: _inputDecoration('Select Housing Type'),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : _saveFarmProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isSaving
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Save & Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      );

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      );
}
