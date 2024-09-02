import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PowiadomieniedokurieraRecord extends FirestoreRecord {
  PowiadomieniedokurieraRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "restauracja" field.
  DocumentReference? _restauracja;
  DocumentReference? get restauracja => _restauracja;
  bool hasRestauracja() => _restauracja != null;

  // "zamowienie" field.
  DocumentReference? _zamowienie;
  DocumentReference? get zamowienie => _zamowienie;
  bool hasZamowienie() => _zamowienie != null;

  // "typ" field.
  String? _typ;
  String get typ => _typ ?? '';
  bool hasTyp() => _typ != null;

  // "nazwa" field.
  String? _nazwa;
  String get nazwa => _nazwa ?? '';
  bool hasNazwa() => _nazwa != null;

  // "godzina" field.
  DateTime? _godzina;
  DateTime? get godzina => _godzina;
  bool hasGodzina() => _godzina != null;

  // "kurier" field.
  DocumentReference? _kurier;
  DocumentReference? get kurier => _kurier;
  bool hasKurier() => _kurier != null;

  // "miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  void _initializeFields() {
    _restauracja = snapshotData['restauracja'] as DocumentReference?;
    _zamowienie = snapshotData['zamowienie'] as DocumentReference?;
    _typ = snapshotData['typ'] as String?;
    _nazwa = snapshotData['nazwa'] as String?;
    _godzina = snapshotData['godzina'] as DateTime?;
    _kurier = snapshotData['kurier'] as DocumentReference?;
    _miasto = castToType<int>(snapshotData['miasto']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('powiadomieniedokuriera');

  static Stream<PowiadomieniedokurieraRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PowiadomieniedokurieraRecord.fromSnapshot(s));

  static Future<PowiadomieniedokurieraRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PowiadomieniedokurieraRecord.fromSnapshot(s));

  static PowiadomieniedokurieraRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PowiadomieniedokurieraRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PowiadomieniedokurieraRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PowiadomieniedokurieraRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PowiadomieniedokurieraRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PowiadomieniedokurieraRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPowiadomieniedokurieraRecordData({
  DocumentReference? restauracja,
  DocumentReference? zamowienie,
  String? typ,
  String? nazwa,
  DateTime? godzina,
  DocumentReference? kurier,
  int? miasto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'restauracja': restauracja,
      'zamowienie': zamowienie,
      'typ': typ,
      'nazwa': nazwa,
      'godzina': godzina,
      'kurier': kurier,
      'miasto': miasto,
    }.withoutNulls,
  );

  return firestoreData;
}

class PowiadomieniedokurieraRecordDocumentEquality
    implements Equality<PowiadomieniedokurieraRecord> {
  const PowiadomieniedokurieraRecordDocumentEquality();

  @override
  bool equals(
      PowiadomieniedokurieraRecord? e1, PowiadomieniedokurieraRecord? e2) {
    return e1?.restauracja == e2?.restauracja &&
        e1?.zamowienie == e2?.zamowienie &&
        e1?.typ == e2?.typ &&
        e1?.nazwa == e2?.nazwa &&
        e1?.godzina == e2?.godzina &&
        e1?.kurier == e2?.kurier &&
        e1?.miasto == e2?.miasto;
  }

  @override
  int hash(PowiadomieniedokurieraRecord? e) => const ListEquality().hash([
        e?.restauracja,
        e?.zamowienie,
        e?.typ,
        e?.nazwa,
        e?.godzina,
        e?.kurier,
        e?.miasto
      ]);

  @override
  bool isValidKey(Object? o) => o is PowiadomieniedokurieraRecord;
}
