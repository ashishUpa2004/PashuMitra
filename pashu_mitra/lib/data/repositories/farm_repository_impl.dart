import 'dart:io';

import 'package:pashu_mitra/data/data_resources/farm_remote_datasources.dart';

import '../models/farm_profile_model.dart';

class FarmRepositoryImpl {
  final FarmRemoteDataSource remoteDataSource;

  FarmRepositoryImpl({required this.remoteDataSource});

  Future<void> saveFarmProfile(FarmProfileModel profile, {File? file}) async {
    await remoteDataSource.saveFarmProfile(profile, file: file);
  }

  Future<FarmProfileModel?> getFarmProfile(String uid) async {
    return await remoteDataSource.getFarmProfile(uid);
  }

  Future<void> deleteFarmProfile(String uid) async {
    await remoteDataSource.deleteFarmProfile(uid);
  }
}
