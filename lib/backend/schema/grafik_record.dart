import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrafikRecord extends FirestoreRecord {
  GrafikRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "oddwunastejusers" field.
  List<DocumentReference>? _oddwunastejusers;
  List<DocumentReference> get oddwunastejusers => _oddwunastejusers ?? const [];
  bool hasOddwunastejusers() => _oddwunastejusers != null;

  void _initializeFields() {
    _data = snapshotData['data'] as DateTime?;
    _users = getDataList(snapshotData['users']);
    _oddwunastejusers = getDataList(snapshotData['oddwunastejusers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grafik');

  static Stream<GrafikRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrafikRecord.fromSnapshot(s));

  static Future<GrafikRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GrafikRecord.fromSnapshot(s));

  static GrafikRecord fromSnapshot(DocumentSnapshot snapshot) => GrafikRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrafikRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrafikRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrafikRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrafikRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrafikRecordData({
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrafikRecordDocumentEquality implements Equality<GrafikRecord> {
  const GrafikRecordDocumentEquality();

  @override
  bool equals(GrafikRecord? e1, GrafikRecord? e2) {
    const listEquality = ListEquality();
    return e1?.data == e2?.data &&
        listEquality.equals(e1?.users, e2?.users) &&
        listEquality.equals(e1?.oddwunastejusers, e2?.oddwunastejusers);
  }

  @override
  int hash(GrafikRecord? e) =>
      const ListEquality().hash([e?.data, e?.users, e?.oddwunastejusers]);

  @override
  bool isValidKey(Object? o) => o is GrafikRecord;
}
