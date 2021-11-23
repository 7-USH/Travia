import 'package:cloud_firestore/cloud_firestore.dart';

class FirestorInfo {
  final _firestore = FirebaseFirestore.instance;

  void dataStream() async {
    await for (var snapShots
        in _firestore.collection('Destination').snapshots()) {
      for (var getData in snapShots.docs) {
        // ignore: avoid_print
        print(getData.data());
      }
    }
  }
}
