import 'package:hosna/services/MockFirebaseStorage.dart';
import 'package:hosna/services/MockFirestore.dart';

class ProjectUpdateService {
  final MockFirebaseStorage storage;
  final MockFirestore firestore;

  ProjectUpdateService({required this.storage, required this.firestore});

  Future<void> postUpdate({
    required String projectId,
    required String text,
    dynamic image,
  }) async {
    String? imageUrl;

    if (image != null) {
      imageUrl = await storage.uploadAndGetUrl(image);
    }

    await firestore.addUpdate({
      'projectId': projectId,
      'text': text,
      'imageUrl': imageUrl ?? '',
    });
  }
}
