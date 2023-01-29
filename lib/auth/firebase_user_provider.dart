import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ForCarMainFirebaseUser {
  ForCarMainFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ForCarMainFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ForCarMainFirebaseUser> forCarMainFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ForCarMainFirebaseUser>(
      (user) {
        currentUser = ForCarMainFirebaseUser(user);
        return currentUser!;
      },
    );
