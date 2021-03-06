import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';

class FirebaseFunctionsController extends GetxController {
  static FirebaseFunctionsController to = Get.find();

  FirebaseFunctions functions = FirebaseFunctions.instance;

  Future<void> sendPasswordlessSignInLink(String email) async {
    final HttpsCallable callable = FirebaseFunctions.instance
        .httpsCallable('https-callables-auth-sendSignInEmail');
    return callable({
      'data': {
        'email': email,
        'url': 'https://accounts-dev.careyaya.com/verify',
      }
    });
  }
}
