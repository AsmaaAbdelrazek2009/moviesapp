import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviesapp/Models/UserDataModel/useerDM.dart';
//
// class MyDatabase {
//   static CollectionReference<UserDM> getUsersCollection() {
//     return FirebaseFirestore.instance.collection('userCollection').withConverter<UserDM>(
//       fromFirestore: (snapshot, _) => UserDM.fromJson(snapshot.data()!),
//       toFirestore: (user, _) => user.toJson(),
//     );
//   }
//
//   static Future<void> createUserInFirestore(UserDM user) async {
//     return getUsersCollection().doc(user.id).set(user);
//   }
//
//   static Future<UserDM?> getUserFromFireStore(String uid) async {
//     var docSnapshot = await getUsersCollection().doc(uid).get();
//     return docSnapshot.data();
//   }
// }

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


}