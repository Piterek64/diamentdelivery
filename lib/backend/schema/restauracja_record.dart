import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestauracjaRecord extends FirestoreRecord {
  RestauracjaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nazwa" field.
  String? _nazwa;
  String get nazwa => _nazwa ?? '';
  bool hasNazwa() => _nazwa != null;

  // "adres" field.
  String? _adres;
  String get adres => _adres ?? '';
  bool hasAdres() => _adres != null;

  // "telefon" field.
  String? _telefon;
  String get telefon => _telefon ?? '';
  bool hasTelefon() => _telefon != null;

  // "miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  // "aktywna" field.
  bool? _aktywna;
  bool get aktywna => _aktywna ?? false;
  bool hasAktywna() => _aktywna != null;

  // "pracownicy" field.
  List<DocumentReference>? _pracownicy;
  List<DocumentReference> get pracownicy => _pracownicy ?? const [];
  bool hasPracownicy() => _pracownicy != null;

  void _initializeFields() {
    _nazwa = snapshotData['Nazwa'] as String?;
    _adres = snapshotData['adres'] as String?;
    _telefon = snapshotData['telefon'] as String?;
    _miasto = castToType<int>(snapshotData['miasto']);
    _aktywna = snapshotData['aktywna'] as bool?;
    _pracownicy = getDataList(snapshotData['pracownicy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Restauracja');

  static Stream<RestauracjaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestauracjaRecord.fromSnapshot(s));

  static Future<RestauracjaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestauracjaRecord.fromSnapshot(s));

  static RestauracjaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestauracjaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestauracjaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestauracjaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestauracjaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestauracjaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestauracjaRecordData({
  String? nazwa,
  String? adres,
  String? telefon,
  int? miasto,
  bool? aktywna,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nazwa': nazwa,
      'adres': adres,
      'telefon': telefon,
      'miasto': miasto,
      'aktywna': aktywna,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestauracjaRecordDocumentEquality implements Equality<RestauracjaRecord> {
  const RestauracjaRecordDocumentEquality();

  @override
  bool equals(RestauracjaRecord? e1, RestauracjaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nazwa == e2?.nazwa &&
        e1?.adres == e2?.adres &&
        e1?.telefon == e2?.telefon &&
        e1?.miasto == e2?.miasto &&
        e1?.aktywna == e2?.aktywna &&
        listEquality.equals(e1?.pracownicy, e2?.pracownicy);
  }

  @override
  int hash(RestauracjaRecord? e) => const ListEquality().hash(
      [e?.nazwa, e?.adres, e?.telefon, e?.miasto, e?.aktywna, e?.pracownicy]);

  @override
  bool isValidKey(Object? o) => o is RestauracjaRecord;
}
