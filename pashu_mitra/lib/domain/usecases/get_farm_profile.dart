import '../../data/repositories/farm_repository_impl.dart';
import '../entities/farm_profile_entity.dart';

class GetFarmProfileUseCase {
  final FarmRepositoryImpl repository;

  GetFarmProfileUseCase(this.repository);

  Future<FarmProfileEntity?> call(String uid) async {
    final model = await repository.getFarmProfile(uid);
    if (model == null) return null;

    return FarmProfileEntity(
      uid: model.uid,
      farmerName: model.farmerName,
      farmType: model.farmType,
      location: model.location,
      housingType: model.housingType,
      vaccinationFileUrl: model.vaccinationFileUrl,
    );
  }
}
