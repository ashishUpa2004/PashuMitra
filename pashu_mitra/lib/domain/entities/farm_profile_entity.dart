class FarmProfileEntity {
  final String uid;
  final String farmerName;
  final String farmType;
  final String location;
  final String housingType;
  final String? vaccinationFileUrl;

  const FarmProfileEntity({
    required this.uid,
    required this.farmerName,
    required this.farmType,
    required this.location,
    required this.housingType,
    this.vaccinationFileUrl,
  });

  FarmProfileEntity copyWith({
    String? uid,
    String? farmerName,
    String? farmType,
    String? location,
    String? housingType,
    String? vaccinationFileUrl,
  }) {
    return FarmProfileEntity(
      uid: uid ?? this.uid,
      farmerName: farmerName ?? this.farmerName,
      farmType: farmType ?? this.farmType,
      location: location ?? this.location,
      housingType: housingType ?? this.housingType,
      vaccinationFileUrl: vaccinationFileUrl ?? this.vaccinationFileUrl,
    );
  }
}
