import 'package:cloud_firestore/cloud_firestore.dart';

class FarmProfileModel {
  final String uid;
  final String farmerName;
  final String farmType;
  final String location;
  final String housingType;
  final String? vaccinationFileUrl;
  final Timestamp? updatedAt;

  FarmProfileModel({
    required this.uid,
    required this.farmerName,
    required this.farmType,
    required this.location,
    required this.housingType,
    this.vaccinationFileUrl,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'farmerName': farmerName,
      'farmType': farmType,
      'location': location,
      'housingType': housingType,
      'vaccinationFileUrl': vaccinationFileUrl,
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  factory FarmProfileModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FarmProfileModel(
      uid: doc.id,
      farmerName: data['farmerName'] ?? '',
      farmType: data['farmType'] ?? '',
      location: data['location'] ?? '',
      housingType: data['housingType'] ?? '',
      vaccinationFileUrl: data['vaccinationFileUrl'],
      updatedAt: data['updatedAt'],
    );
  }
}
