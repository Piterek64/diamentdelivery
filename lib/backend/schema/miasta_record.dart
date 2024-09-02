import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MiastaRecord extends FirestoreRecord {
  MiastaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "numer" field.
  int? _numer;
  int get numer => _numer ?? 0;
  bool hasNumer() => _numer != null;

  // "nazwa" field.
  String? _nazwa;
  String get nazwa => _nazwa ?? '';
  bool hasNazwa() => _nazwa != null;

  void _initializeFields() {
    _numer = castToType<int>(snapshotData['numer']);
    _nazwa = snapshotData['nazwa'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('miasta');

  static Stream<MiastaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MiastaRecord.fromSnapshot(s));

  static Future<MiastaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MiastaRecord.fromSnapshot(s));

  static MiastaRecord fromSnapshot(DocumentSnapshot snapshot) => MiastaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MiastaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MiastaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MiastaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MiastaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMiastaRecordData({
  int? numer,
  String? nazwa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numer': numer,
      'nazwa': nazwa,
    }.withoutNulls,
  );

  return firestoreData;
}

class MiastaRecordDocumentEquality implements Equality<MiastaRecord> {
  const MiastaRecordDocumentEquality();

  @override
  bool equals(MiastaRecord? e1, MiastaRecord? e2) {
    return e1?.numer == e2?.numer && e1?.nazwa == e2?.nazwa;
  }

  @override
  int hash(MiastaRecord? e) => const ListEquality().hash([e?.numer, e?.nazwa]);

  @override
  bool isValidKey(Object? o) => o is MiastaRecord;
}
