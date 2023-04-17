import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/core/extension/log.dart';

abstract class BaseAuth {
  Future<String?> signIn(String email, String password);

  Future<String?> signUp(String email, String password);

  User? getCurrentUser();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<String?> changeEmail(String email);

  Future<void> changePassword(String password);

  Future<void> sendPasswordResetMail(String email);
}

class AuthenticationService implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } catch (e) {
      return 'Tài khoản hoặc mật khẩu không chính xác';
    }
  }

  @override
  Future<String?> signUp(String email, String password) async {
    try {
   await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Your password is weak';
      } else if (e.code == 'email-already-in-use') {
        return 'Your email is exits';
      } else {
        return 'Your information invalid $e';
      }
    } catch (e) {
      return 'Your information invalid $e';
    }
  }

  @override
  User? getCurrentUser() {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return user;
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isEmailVerified() async {
    User? user = getCurrentUser();
    if (user != null) {
      return user.emailVerified;
    }
    logError('Email chưa đăng nhập');
    return false;
  }

  @override
  Future<String?> changeEmail(String email) async {
    User? user = getCurrentUser();
    if (user != null) {
      user.updateEmail(email).then((_) {
        return 'Thay đổi email thành công';
      }).catchError((error) {
        return 'Có vấn đề khi thay đổi email $error';
      });
    }
    return null;
  }

  @override
  Future<void> changePassword(String password) async {
    User? user = getCurrentUser();
    if (user != null) {
      user.updatePassword(password).then((_) {
        return 'Thay mật khẩu thành công';
      }).catchError((error) {
        return 'Lỗi khi thay đổi mật khẩu $error';
      });
    } else {
      logError('Lỗi chưa đăng nhập với tư cách User');
    }
  }

  @override
  Future<void> sendPasswordResetMail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return;
  }
}
