import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PowiadomieniaRecord extends FirestoreRecord {
  PowiadomieniaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "powiadoim" field.
  bool? _powiadoim;
  bool get powiadoim => _powiadoim ?? false;
  bool hasPowiadoim() => _powiadoim != null;

  // "miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  void _initializeFields() {
    _powiadoim = snapshotData['powiadoim'] as bool?;
    _miasto = castToType<int>(snapshotData['miasto']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Powiadomienia');

  static Stream<PowiadomieniaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PowiadomieniaRecord.fromSnapshot(s));

  static Future<PowiadomieniaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PowiadomieniaRecord.fromSnapshot(s));

  static PowiadomieniaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PowiadomieniaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PowiadomieniaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PowiadomieniaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PowiadomieniaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PowiadomieniaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPowiadomieniaRecordData({
  bool? powiadoim,
  int? miasto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'powiadoim': powiadoim,
      'miasto': miasto,
    }.withoutNulls,
  );

  return firestoreData;
}

class PowiadomieniaRecordDocumentEquality
    implements Equality<PowiadomieniaRecord> {
  const PowiadomieniaRecordDocumentEquality();

  @override
  bool equals(PowiadomieniaRecord? e1, PowiadomieniaRecord? e2) {
    return e1?.powiadoim == e2?.powiadoim && e1?.miasto == e2?.miasto;
  }

  @override
  int hash(PowiadomieniaRecord? e) =>
      const ListEquality().hash([e?.powiadoim, e?.miasto]);

  @override
  bool isValidKey(Object? o) => o is PowiadomieniaRecord;
}
