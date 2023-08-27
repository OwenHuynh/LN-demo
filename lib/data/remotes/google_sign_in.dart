import 'package:lnsp/domain/entities/image/image.dart';
import 'package:lnsp/domain/entities/user/user_detail.dart'
    as MyUser;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lnsp/data/locals/app_preferences/app_preferences.dart';
import 'package:synchronized/synchronized.dart';

class GoogleSignInFirebase {
  GoogleSignInFirebase._();
  static Lock _lock = Lock();
  static GoogleSignInFirebase? _instance;

  static Future<GoogleSignInFirebase?> getInstance() async {
    if (_instance == null) {
      await _lock.synchronized(() async {
        final singleton = GoogleSignInFirebase._();
        _instance = singleton;
      });
    }
    return _instance;
  }

  final googleSignIn = GoogleSignIn();
  late GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<bool> signInGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return false;
    }
    _user = googleUser;

    final myUser = MyUser.UserDetail(
      name: _user?.displayName ?? "",
      icon: Image(path: _user!.photoUrl ?? ""),
      id: _user?.id ?? "",
    );
    await AppPreferences.setProfileData(myUser);
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    print(_user);
    return true;
  }
}
