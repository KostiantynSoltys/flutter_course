import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:intl/intl.dart';

class Repository {
  String? url;
  final CollectionReference _artCardsCollection =
      FirebaseFirestore.instance.collection('art_cards');
  Reference get firebaseStorage => FirebaseStorage.instance.ref();

  Stream<List<ArtCard>> getArtCards() {
    return _artCardsCollection
        .where('day', isLessThanOrEqualTo: DateTime.now())
        .orderBy('day', descending: true)
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return ArtCard(
              id: doc.id,
              day: DateFormat.yMd().format(data['day'].toDate()),
              image: data['image'],
              title: data['title'],
              text: data['text'],
              likes: data['likes'],
              source_links: data['source_links'],
              more_art_links: data['more_art_links'],
            );
          },
        ).toList();
      },
    );
  }

  Stream<List<ArtCard>> getLikedList() {
    return _artCardsCollection
        .where('likes', arrayContains: userEmail())
        .orderBy('day', descending: true)
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return ArtCard(
              id: doc.id,
              day: DateFormat.yMd().format(data['day'].toDate()),
              image: data['image'],
              title: data['title'],
              text: data['text'],
              likes: data['likes'],
              source_links: data['source_links'],
              more_art_links: data['more_art_links'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> likeCard({required String id}) async {
    List<String?> currentUser = [userEmail()];
    try {
      await _artCardsCollection.doc(id).update(
        {'likes': FieldValue.arrayUnion(currentUser)},
      );
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}' : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> unlikeCard({required String id}) async {
    List<String?> currentUser = [userEmail()];
    try {
      await _artCardsCollection.doc(id).update(
        {'likes': FieldValue.arrayRemove(currentUser)},
      );
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}' : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage.child(imgName);
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }

  String? userEmail() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (user != null) {
      return user.email;
    }
    return null;
  }
}
