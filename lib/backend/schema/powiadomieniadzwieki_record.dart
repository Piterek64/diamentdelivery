import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PowiadomieniadzwiekiRecord extends FirestoreRecord {
  PowiadomieniadzwiekiRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Powiadomienie" field.
  String? _powiadomienie;
  String get powiadomienie => _powiadomienie ?? '';
  bool hasPowiadomienie() => _powiadomienie != null;

  // "Nazwa" field.
  String? _nazwa;
  String get nazwa => _nazwa ?? '';
  bool hasNazwa() => _nazwa != null;

  void _initializeFields() {
    _powiadomienie = snapshotData['Powiadomienie'] as String?;
    _nazwa = snapshotData['Nazwa'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Powiadomieniadzwieki');

  static Stream<PowiadomieniadzwiekiRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PowiadomieniadzwiekiRecord.fromSnapshot(s));

  static Future<PowiadomieniadzwiekiRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PowiadomieniadzwiekiRecord.fromSnapshot(s));

  static PowiadomieniadzwiekiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PowiadomieniadzwiekiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PowiadomieniadzwiekiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PowiadomieniadzwiekiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PowiadomieniadzwiekiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PowiadomieniadzwiekiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPowiadomieniadzwiekiRecordData({
  String? powiadomienie,
  String? nazwa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Powiadomienie': powiadomienie,
      'Nazwa': nazwa,
    }.withoutNulls,
  );

  return firestoreData;
}

class PowiadomieniadzwiekiRecordDocumentEquality
    implements Equality<PowiadomieniadzwiekiRecord> {
  const PowiadomieniadzwiekiRecordDocumentEquality();

  @override
  bool equals(PowiadomieniadzwiekiRecord? e1, PowiadomieniadzwiekiRecord? e2) {
    return e1?.powiadomienie == e2?.powiadomienie && e1?.nazwa == e2?.nazwa;
  }

  @override
  int hash(PowiadomieniadzwiekiRecord? e) =>
      const ListEquality().hash([e?.powiadomienie, e?.nazwa]);

  @override
  bool isValidKey(Object? o) => o is PowiadomieniadzwiekiRecord;
}
