import '../../data/repositories/farm_repository_impl.dart';

class DeleteFarmProfileUseCase {
  final FarmRepositoryImpl repository;

  DeleteFarmProfileUseCase(this.repository);

  Future<void> call(String uid) async {
    await repository.deleteFarmProfile(uid);
  }
}
