import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PowiadomienieprzyjalemRecord extends FirestoreRecord {
  PowiadomienieprzyjalemRecord._(
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

  // "godzina" field.
  DateTime? _godzina;
  DateTime? get godzina => _godzina;
  bool hasGodzina() => _godzina != null;

  // "typ" field.
  String? _typ;
  String get typ => _typ ?? '';
  bool hasTyp() => _typ != null;

  // "nazwa" field.
  String? _nazwa;
  String get nazwa => _nazwa ?? '';
  bool hasNazwa() => _nazwa != null;

  void _initializeFields() {
    _restauracja = snapshotData['restauracja'] as DocumentReference?;
    _zamowienie = snapshotData['zamowienie'] as DocumentReference?;
    _godzina = snapshotData['godzina'] as DateTime?;
    _typ = snapshotData['typ'] as String?;
    _nazwa = snapshotData['nazwa'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('powiadomienieprzyjalem');

  static Stream<PowiadomienieprzyjalemRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PowiadomienieprzyjalemRecord.fromSnapshot(s));

  static Future<PowiadomienieprzyjalemRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PowiadomienieprzyjalemRecord.fromSnapshot(s));

  static PowiadomienieprzyjalemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PowiadomienieprzyjalemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PowiadomienieprzyjalemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PowiadomienieprzyjalemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PowiadomienieprzyjalemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PowiadomienieprzyjalemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPowiadomienieprzyjalemRecordData({
  DocumentReference? restauracja,
  DocumentReference? zamowienie,
  DateTime? godzina,
  String? typ,
  String? nazwa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'restauracja': restauracja,
      'zamowienie': zamowienie,
      'godzina': godzina,
      'typ': typ,
      'nazwa': nazwa,
    }.withoutNulls,
  );

  return firestoreData;
}

class PowiadomienieprzyjalemRecordDocumentEquality
    implements Equality<PowiadomienieprzyjalemRecord> {
  const PowiadomienieprzyjalemRecordDocumentEquality();

  @override
  bool equals(
      PowiadomienieprzyjalemRecord? e1, PowiadomienieprzyjalemRecord? e2) {
    return e1?.restauracja == e2?.restauracja &&
        e1?.zamowienie == e2?.zamowienie &&
        e1?.godzina == e2?.godzina &&
        e1?.typ == e2?.typ &&
        e1?.nazwa == e2?.nazwa;
  }

  @override
  int hash(PowiadomienieprzyjalemRecord? e) => const ListEquality()
      .hash([e?.restauracja, e?.zamowienie, e?.godzina, e?.typ, e?.nazwa]);

  @override
  bool isValidKey(Object? o) => o is PowiadomienieprzyjalemRecord;
}
