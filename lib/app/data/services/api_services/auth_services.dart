abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<String> currentUser();
  Future<void> signOut();
}

class AuthServices implements BaseAuth {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 50));
    // final FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    // return user?.uid;
    return "12-33";
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    // final FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    // return user?.uid;
    return "12-33";
  }

  @override
  Future<String> currentUser() async {
    // final FirebaseUser user = await _firebaseAuth.currentUser();
    // return user?.uid;
    return "12-33";
  }

  @override
  Future<void> signOut() async {
    print("signOut");
    // return _firebaseAuth.signOut();
  }
}
