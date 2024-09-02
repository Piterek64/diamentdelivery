import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StrefyRecord extends FirestoreRecord {
  StrefyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  // "numer" field.
  int? _numer;
  int get numer => _numer ?? 0;
  bool hasNumer() => _numer != null;

  // "cena" field.
  double? _cena;
  double get cena => _cena ?? 0.0;
  bool hasCena() => _cena != null;

  void _initializeFields() {
    _miasto = castToType<int>(snapshotData['miasto']);
    _numer = castToType<int>(snapshotData['numer']);
    _cena = castToType<double>(snapshotData['cena']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('strefy');

  static Stream<StrefyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StrefyRecord.fromSnapshot(s));

  static Future<StrefyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StrefyRecord.fromSnapshot(s));

  static StrefyRecord fromSnapshot(DocumentSnapshot snapshot) => StrefyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StrefyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StrefyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StrefyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StrefyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStrefyRecordData({
  int? miasto,
  int? numer,
  double? cena,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'miasto': miasto,
      'numer': numer,
      'cena': cena,
    }.withoutNulls,
  );

  return firestoreData;
}

class StrefyRecordDocumentEquality implements Equality<StrefyRecord> {
  const StrefyRecordDocumentEquality();

  @override
  bool equals(StrefyRecord? e1, StrefyRecord? e2) {
    return e1?.miasto == e2?.miasto &&
        e1?.numer == e2?.numer &&
        e1?.cena == e2?.cena;
  }

  @override
  int hash(StrefyRecord? e) =>
      const ListEquality().hash([e?.miasto, e?.numer, e?.cena]);

  @override
  bool isValidKey(Object? o) => o is StrefyRecord;
}
