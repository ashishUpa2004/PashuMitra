// lib/presentation/providers/farm_usecase_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pashu_mitra/data/data_resources/farm_remote_datasources.dart';
import 'package:pashu_mitra/data/repositories/farm_repository_impl.dart';
import 'package:pashu_mitra/domain/usecases/delete_farm_profile.dart';
import 'package:pashu_mitra/domain/usecases/get_farm_profile.dart';
import 'package:pashu_mitra/domain/usecases/save_farm_profile.dart';

final _repoProvider = Provider<FarmRepositoryImpl>((ref) {
  final ds = FarmRemoteDataSource(
    firestore: FirebaseFirestore.instance,
    storage: FirebaseStorage.instance,
  );
  return FarmRepositoryImpl(remoteDataSource: ds);
});

final getFarmProfileUseCaseProvider = Provider<GetFarmProfileUseCase>((ref) {
  return GetFarmProfileUseCase(ref.watch(_repoProvider));
});

final saveFarmProfileUseCaseProvider = Provider<SaveFarmProfileUseCase>((ref) {
  return SaveFarmProfileUseCase(ref.watch(_repoProvider));
});

final deleteFarmProfileUseCaseProvider = Provider<DeleteFarmProfileUseCase>((ref) {
  return DeleteFarmProfileUseCase(ref.watch(_repoProvider));
});
