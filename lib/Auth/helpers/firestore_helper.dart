import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_firebase_gsg/Auth/models/register_request.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addUserToFireStore(RegisterRequest registerRequest) async {
    try {
      // await firestore.collection('Users').add(registerRequest.toMap());
      await firestore
          .collection('Users')
          .doc(registerRequest.id)
          .set(registerRequest.toMap());
    } on Exception catch (e) {
      print(e);
    }
  }

  getUserFromFirestore(String userId) async {
    DocumentSnapshot documentSnapshot =
        await firestore.collection('Users').doc(userId).get();
    print(documentSnapshot.data);
  }
}
