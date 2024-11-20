/*
This database store post that user have publish in the app. it is stored in a
 collection called 'Posts' i Firebase

 Each post contain;
 -a massage
 -email of user
 - timestamp

 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  //current logged in use
  User? user = FirebaseAuth.instance.currentUser;

  // get collection of posts from firebase
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');

  //post a message
  Future<void> addPost(String message) {
    return posts.add({
      'UserEmail': user!.email,
      'PostMessage': message,
      'TimeSt'
          'amp': Timestamp.now(),
    });
  }

//read  posts from database
  Stream<QuerySnapshot> getPostStream() {
    final postStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('TimeStamp', descending: true)
        .snapshots();
    return postStream;
  }
}
