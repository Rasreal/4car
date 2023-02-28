import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ForcarFirebaseUser {
  ForcarFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ForcarFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ForcarFirebaseUser> forcarFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ForcarFirebaseUser>(
      (user) {
        currentUser = ForcarFirebaseUser(user);
        return currentUser!;
      },
    );
