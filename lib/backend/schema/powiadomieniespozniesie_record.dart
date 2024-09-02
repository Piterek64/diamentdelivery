import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PowiadomieniespozniesieRecord extends FirestoreRecord {
  PowiadomieniespozniesieRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "retauracja" field.
  DocumentReference? _retauracja;
  DocumentReference? get retauracja => _retauracja;
  bool hasRetauracja() => _retauracja != null;

  // "zamowienie" field.
  DocumentReference? _zamowienie;
  DocumentReference? get zamowienie => _zamowienie;
  bool hasZamowienie() => _zamowienie != null;

  // "Typ" field.
  String? _typ;
  String get typ => _typ ?? '';
  bool hasTyp() => _typ != null;

  // "Opis" field.
  String? _opis;
  String get opis => _opis ?? '';
  bool hasOpis() => _opis != null;

  // "godzina" field.
  DateTime? _godzina;
  DateTime? get godzina => _godzina;
  bool hasGodzina() => _godzina != null;

  void _initializeFields() {
    _retauracja = snapshotData['retauracja'] as DocumentReference?;
    _zamowienie = snapshotData['zamowienie'] as DocumentReference?;
    _typ = snapshotData['Typ'] as String?;
    _opis = snapshotData['Opis'] as String?;
    _godzina = snapshotData['godzina'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('powiadomieniespozniesie');

  static Stream<PowiadomieniespozniesieRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PowiadomieniespozniesieRecord.fromSnapshot(s));

  static Future<PowiadomieniespozniesieRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PowiadomieniespozniesieRecord.fromSnapshot(s));

  static PowiadomieniespozniesieRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PowiadomieniespozniesieRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PowiadomieniespozniesieRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PowiadomieniespozniesieRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PowiadomieniespozniesieRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PowiadomieniespozniesieRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPowiadomieniespozniesieRecordData({
  DocumentReference? retauracja,
  DocumentReference? zamowienie,
  String? typ,
  String? opis,
  DateTime? godzina,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'retauracja': retauracja,
      'zamowienie': zamowienie,
      'Typ': typ,
      'Opis': opis,
      'godzina': godzina,
    }.withoutNulls,
  );

  return firestoreData;
}

class PowiadomieniespozniesieRecordDocumentEquality
    implements Equality<PowiadomieniespozniesieRecord> {
  const PowiadomieniespozniesieRecordDocumentEquality();

  @override
  bool equals(
      PowiadomieniespozniesieRecord? e1, PowiadomieniespozniesieRecord? e2) {
    return e1?.retauracja == e2?.retauracja &&
        e1?.zamowienie == e2?.zamowienie &&
        e1?.typ == e2?.typ &&
        e1?.opis == e2?.opis &&
        e1?.godzina == e2?.godzina;
  }

  @override
  int hash(PowiadomieniespozniesieRecord? e) => const ListEquality()
      .hash([e?.retauracja, e?.zamowienie, e?.typ, e?.opis, e?.godzina]);

  @override
  bool isValidKey(Object? o) => o is PowiadomieniespozniesieRecord;
}
