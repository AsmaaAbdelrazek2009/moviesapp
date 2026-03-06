import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviesapp/Models/UserDataModel/useerDM.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MyDatabase {
  static CollectionReference<UserDM> _getCollectionRef() {
    return FirebaseFirestore.instance
        .collection("userCollection")
        .withConverter<UserDM>(
      fromFirestore: (snapshot, _) => UserDM.fromJson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );
  }
  static Future<void> createUserInFirestore(UserDM user) async {
    var collectionRef = _getCollectionRef();
    var docRef = collectionRef.doc(user.id);

    return docRef.set(user);
  }
  static Future<UserDM?> getUserFromFireStore(String id) async {
    var collectionRef = _getCollectionRef();
    var docSnapshot = await collectionRef.doc(id).get();
    return docSnapshot.data(); }

  static Future<void> updateUserInFirestore(UserDM user) async {

    var collectionRef = _getCollectionRef();

    var docRef = collectionRef.doc(user.id);

    return docRef.update(user.toJson());

  }


  static Future<bool> deleteAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return false;

      await _getCollectionRef().doc(user.uid).delete();

      await user.delete();

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print("User needs to re-authenticate");
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}