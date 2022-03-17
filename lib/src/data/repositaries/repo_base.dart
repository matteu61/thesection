import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRepository {
  List<DocumentSnapshot> getStreamList();
}
