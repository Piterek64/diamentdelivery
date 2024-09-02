import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WyplatyRecord extends FirestoreRecord {
  WyplatyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "kurier" field.
  DocumentReference? _kurier;
  DocumentReference? get kurier => _kurier;
  bool hasKurier() => _kurier != null;

  // "kwota" field.
  double? _kwota;
  double get kwota => _kwota ?? 0.0;
  bool hasKwota() => _kwota != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _kurier = snapshotData['kurier'] as DocumentReference?;
    _kwota = castToType<double>(snapshotData['kwota']);
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wyplaty');

  static Stream<WyplatyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WyplatyRecord.fromSnapshot(s));

  static Future<WyplatyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WyplatyRecord.fromSnapshot(s));

  static WyplatyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WyplatyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WyplatyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WyplatyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WyplatyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WyplatyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWyplatyRecordData({
  DocumentReference? kurier,
  double? kwota,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'kurier': kurier,
      'kwota': kwota,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class WyplatyRecordDocumentEquality implements Equality<WyplatyRecord> {
  const WyplatyRecordDocumentEquality();

  @override
  bool equals(WyplatyRecord? e1, WyplatyRecord? e2) {
    return e1?.kurier == e2?.kurier &&
        e1?.kwota == e2?.kwota &&
        e1?.data == e2?.data;
  }

  @override
  int hash(WyplatyRecord? e) =>
      const ListEquality().hash([e?.kurier, e?.kwota, e?.data]);

  @override
  bool isValidKey(Object? o) => o is WyplatyRecord;
}
