import '../../data/repositories/farm_repository_impl.dart';
import '../entities/farm_profile_entity.dart';
import 'dart:io';
import '../../data/models/farm_profile_model.dart';

class SaveFarmProfileUseCase {
  final FarmRepositoryImpl repository;

  SaveFarmProfileUseCase(this.repository);

  Future<void> call(FarmProfileEntity entity, {File? file}) async {
    final model = FarmProfileModel(
      uid: entity.uid,
      farmerName: entity.farmerName,
      farmType: entity.farmType,
      location: entity.location,
      housingType: entity.housingType,
      vaccinationFileUrl: entity.vaccinationFileUrl,
    );

    await repository.saveFarmProfile(model, file: file);
  }
}
