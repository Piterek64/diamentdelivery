import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PowRecord extends FirestoreRecord {
  PowRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  // "id" field.
  DateTime? _id;
  DateTime? get id => _id;
  bool hasId() => _id != null;

  void _initializeFields() {
    _miasto = castToType<int>(snapshotData['miasto']);
    _id = snapshotData['id'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pow');

  static Stream<PowRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PowRecord.fromSnapshot(s));

  static Future<PowRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PowRecord.fromSnapshot(s));

  static PowRecord fromSnapshot(DocumentSnapshot snapshot) => PowRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PowRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PowRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PowRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PowRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPowRecordData({
  int? miasto,
  DateTime? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'miasto': miasto,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class PowRecordDocumentEquality implements Equality<PowRecord> {
  const PowRecordDocumentEquality();

  @override
  bool equals(PowRecord? e1, PowRecord? e2) {
    return e1?.miasto == e2?.miasto && e1?.id == e2?.id;
  }

  @override
  int hash(PowRecord? e) => const ListEquality().hash([e?.miasto, e?.id]);

  @override
  bool isValidKey(Object? o) => o is PowRecord;
}
