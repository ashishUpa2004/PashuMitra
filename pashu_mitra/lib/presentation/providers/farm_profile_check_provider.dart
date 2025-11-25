import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pashu_mitra/core/constants/app_constants.dart';

final farmProfileCheckProvider = FutureProvider<bool>((ref) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return false;

  final doc = await FirebaseFirestore.instance
      .collection(AppConstants.farmProfilesCollection)
      .doc(user.uid)
      .get();

  return doc.exists;
});
