import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WyzwaniaRecord extends FirestoreRecord {
  WyzwaniaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "typ" field.
  int? _typ;
  int get typ => _typ ?? 0;
  bool hasTyp() => _typ != null;

  // "nagroda" field.
  int? _nagroda;
  int get nagroda => _nagroda ?? 0;
  bool hasNagroda() => _nagroda != null;

  // "poczatkowa" field.
  DateTime? _poczatkowa;
  DateTime? get poczatkowa => _poczatkowa;
  bool hasPoczatkowa() => _poczatkowa != null;

  // "koncowa" field.
  DateTime? _koncowa;
  DateTime? get koncowa => _koncowa;
  bool hasKoncowa() => _koncowa != null;

  // "nazwa" field.
  String? _nazwa;
  String get nazwa => _nazwa ?? '';
  bool hasNazwa() => _nazwa != null;

  // "opis" field.
  String? _opis;
  String get opis => _opis ?? '';
  bool hasOpis() => _opis != null;

  // "miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  // "aktywne" field.
  bool? _aktywne;
  bool get aktywne => _aktywne ?? false;
  bool hasAktywne() => _aktywne != null;

  // "listakurierowprzyjeci" field.
  List<DocumentReference>? _listakurierowprzyjeci;
  List<DocumentReference> get listakurierowprzyjeci =>
      _listakurierowprzyjeci ?? const [];
  bool hasListakurierowprzyjeci() => _listakurierowprzyjeci != null;

  // "iloscwymagana" field.
  int? _iloscwymagana;
  int get iloscwymagana => _iloscwymagana ?? 0;
  bool hasIloscwymagana() => _iloscwymagana != null;

  void _initializeFields() {
    _typ = castToType<int>(snapshotData['typ']);
    _nagroda = castToType<int>(snapshotData['nagroda']);
    _poczatkowa = snapshotData['poczatkowa'] as DateTime?;
    _koncowa = snapshotData['koncowa'] as DateTime?;
    _nazwa = snapshotData['nazwa'] as String?;
    _opis = snapshotData['opis'] as String?;
    _miasto = castToType<int>(snapshotData['miasto']);
    _aktywne = snapshotData['aktywne'] as bool?;
    _listakurierowprzyjeci = getDataList(snapshotData['listakurierowprzyjeci']);
    _iloscwymagana = castToType<int>(snapshotData['iloscwymagana']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wyzwania');

  static Stream<WyzwaniaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WyzwaniaRecord.fromSnapshot(s));

  static Future<WyzwaniaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WyzwaniaRecord.fromSnapshot(s));

  static WyzwaniaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WyzwaniaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WyzwaniaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WyzwaniaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WyzwaniaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WyzwaniaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWyzwaniaRecordData({
  int? typ,
  int? nagroda,
  DateTime? poczatkowa,
  DateTime? koncowa,
  String? nazwa,
  String? opis,
  int? miasto,
  bool? aktywne,
  int? iloscwymagana,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'typ': typ,
      'nagroda': nagroda,
      'poczatkowa': poczatkowa,
      'koncowa': koncowa,
      'nazwa': nazwa,
      'opis': opis,
      'miasto': miasto,
      'aktywne': aktywne,
      'iloscwymagana': iloscwymagana,
    }.withoutNulls,
  );

  return firestoreData;
}

class WyzwaniaRecordDocumentEquality implements Equality<WyzwaniaRecord> {
  const WyzwaniaRecordDocumentEquality();

  @override
  bool equals(WyzwaniaRecord? e1, WyzwaniaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.typ == e2?.typ &&
        e1?.nagroda == e2?.nagroda &&
        e1?.poczatkowa == e2?.poczatkowa &&
        e1?.koncowa == e2?.koncowa &&
        e1?.nazwa == e2?.nazwa &&
        e1?.opis == e2?.opis &&
        e1?.miasto == e2?.miasto &&
        e1?.aktywne == e2?.aktywne &&
        listEquality.equals(
            e1?.listakurierowprzyjeci, e2?.listakurierowprzyjeci) &&
        e1?.iloscwymagana == e2?.iloscwymagana;
  }

  @override
  int hash(WyzwaniaRecord? e) => const ListEquality().hash([
        e?.typ,
        e?.nagroda,
        e?.poczatkowa,
        e?.koncowa,
        e?.nazwa,
        e?.opis,
        e?.miasto,
        e?.aktywne,
        e?.listakurierowprzyjeci,
        e?.iloscwymagana
      ]);

  @override
  bool isValidKey(Object? o) => o is WyzwaniaRecord;
}
