import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UkonczonewyzwaniaRecord extends FirestoreRecord {
  UkonczonewyzwaniaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "wyzwanie" field.
  DocumentReference? _wyzwanie;
  DocumentReference? get wyzwanie => _wyzwanie;
  bool hasWyzwanie() => _wyzwanie != null;

  // "kurier" field.
  DocumentReference? _kurier;
  DocumentReference? get kurier => _kurier;
  bool hasKurier() => _kurier != null;

  // "nagroda" field.
  int? _nagroda;
  int get nagroda => _nagroda ?? 0;
  bool hasNagroda() => _nagroda != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  // "zrealizowane" field.
  int? _zrealizowane;
  int get zrealizowane => _zrealizowane ?? 0;
  bool hasZrealizowane() => _zrealizowane != null;

  void _initializeFields() {
    _wyzwanie = snapshotData['wyzwanie'] as DocumentReference?;
    _kurier = snapshotData['kurier'] as DocumentReference?;
    _nagroda = castToType<int>(snapshotData['nagroda']);
    _data = snapshotData['data'] as DateTime?;
    _miasto = castToType<int>(snapshotData['miasto']);
    _zrealizowane = castToType<int>(snapshotData['zrealizowane']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ukonczonewyzwania');

  static Stream<UkonczonewyzwaniaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UkonczonewyzwaniaRecord.fromSnapshot(s));

  static Future<UkonczonewyzwaniaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UkonczonewyzwaniaRecord.fromSnapshot(s));

  static UkonczonewyzwaniaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UkonczonewyzwaniaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UkonczonewyzwaniaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UkonczonewyzwaniaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UkonczonewyzwaniaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UkonczonewyzwaniaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUkonczonewyzwaniaRecordData({
  DocumentReference? wyzwanie,
  DocumentReference? kurier,
  int? nagroda,
  DateTime? data,
  int? miasto,
  int? zrealizowane,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wyzwanie': wyzwanie,
      'kurier': kurier,
      'nagroda': nagroda,
      'data': data,
      'miasto': miasto,
      'zrealizowane': zrealizowane,
    }.withoutNulls,
  );

  return firestoreData;
}

class UkonczonewyzwaniaRecordDocumentEquality
    implements Equality<UkonczonewyzwaniaRecord> {
  const UkonczonewyzwaniaRecordDocumentEquality();

  @override
  bool equals(UkonczonewyzwaniaRecord? e1, UkonczonewyzwaniaRecord? e2) {
    return e1?.wyzwanie == e2?.wyzwanie &&
        e1?.kurier == e2?.kurier &&
        e1?.nagroda == e2?.nagroda &&
        e1?.data == e2?.data &&
        e1?.miasto == e2?.miasto &&
        e1?.zrealizowane == e2?.zrealizowane;
  }

  @override
  int hash(UkonczonewyzwaniaRecord? e) => const ListEquality().hash([
        e?.wyzwanie,
        e?.kurier,
        e?.nagroda,
        e?.data,
        e?.miasto,
        e?.zrealizowane
      ]);

  @override
  bool isValidKey(Object? o) => o is UkonczonewyzwaniaRecord;
}
