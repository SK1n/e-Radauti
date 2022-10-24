import 'package:firebase_storage/firebase_storage.dart';

abstract class GetImageUrl {
  Future<String> getImageUrl(String? imgURL) async =>
      await FirebaseStorage.instance
          .refFromURL(imgURL ?? 'gs://eradauti-nativ.appspot.com/404-error.png')
          .getDownloadURL()
          .then(
            (imageUrl) => imageUrl,
          );
}
