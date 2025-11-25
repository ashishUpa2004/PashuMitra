// lib/presentation/providers/farm_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pashu_mitra/data/data_resources/farm_remote_datasources.dart';
import 'package:pashu_mitra/data/models/farm_profile_model.dart';
import 'package:pashu_mitra/data/repositories/farm_repository_impl.dart';

final farmRepoProvider = Provider<FarmRepositoryImpl>((ref) {
  final ds = FarmRemoteDataSource(
    firestore: FirebaseFirestore.instance,
    storage: FirebaseStorage.instance,
  );
  return FarmRepositoryImpl(remoteDataSource: ds);
});

final farmProfileProvider = FutureProvider.family<FarmProfileModel?, String>((ref, uid) {
  return ref.watch(farmRepoProvider).getFarmProfile(uid);
});
