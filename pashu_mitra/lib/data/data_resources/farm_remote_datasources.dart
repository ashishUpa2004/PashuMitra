import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pashu_mitra/data/models/farm_profile_model.dart';


class FarmRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  FarmRemoteDataSource({
    required this.firestore,
    required this.storage,
  });

  Future<void> saveFarmProfile(FarmProfileModel profile, {File? file}) async {
    String? fileUrl;

    if (file != null) {
      final ref = storage
          .ref()
          .child('vaccination_records/${profile.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await ref.putFile(file);
      fileUrl = await ref.getDownloadURL();
    }

    final profileData = profile.toMap();
    if (fileUrl != null) profileData['vaccinationFileUrl'] = fileUrl;

    await firestore.collection('farm_profiles').doc(profile.uid).set(
          profileData,
          SetOptions(merge: true),
        );
  }

  Future<FarmProfileModel?> getFarmProfile(String uid) async {
    final doc = await firestore.collection('farm_profiles').doc(uid).get();
    if (doc.exists) {
      return FarmProfileModel.fromDoc(doc);
    }
    return null;
  }

  Future<void> deleteFarmProfile(String uid) async {
    await firestore.collection('farm_profiles').doc(uid).delete();
  }
}
