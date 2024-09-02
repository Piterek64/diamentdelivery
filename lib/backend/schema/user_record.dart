import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Imie" field.
  String? _imie;
  String get imie => _imie ?? '';
  bool hasImie() => _imie != null;

  // "Nazwisko" field.
  String? _nazwisko;
  String get nazwisko => _nazwisko ?? '';
  bool hasNazwisko() => _nazwisko != null;

  // "Kurier" field.
  bool? _kurier;
  bool get kurier => _kurier ?? false;
  bool hasKurier() => _kurier != null;

  // "Restuaracja" field.
  bool? _restuaracja;
  bool get restuaracja => _restuaracja ?? false;
  bool hasRestuaracja() => _restuaracja != null;

  // "Profilowe" field.
  String? _profilowe;
  String get profilowe => _profilowe ?? '';
  bool hasProfilowe() => _profilowe != null;

  // "wpracy" field.
  bool? _wpracy;
  bool get wpracy => _wpracy ?? false;
  bool hasWpracy() => _wpracy != null;

  // "Restauracja" field.
  DocumentReference? _restauracja;
  DocumentReference? get restauracja => _restauracja;
  bool hasRestauracja() => _restauracja != null;

  // "Administrator" field.
  bool? _administrator;
  bool get administrator => _administrator ?? false;
  bool hasAdministrator() => _administrator != null;

  // "Miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  // "tymczasowy_wybrany_czas" field.
  int? _tymczasowyWybranyCzas;
  int get tymczasowyWybranyCzas => _tymczasowyWybranyCzas ?? 0;
  bool hasTymczasowyWybranyCzas() => _tymczasowyWybranyCzas != null;

  // "tymczasowe_zdj" field.
  String? _tymczasoweZdj;
  String get tymczasoweZdj => _tymczasoweZdj ?? '';
  bool hasTymczasoweZdj() => _tymczasoweZdj != null;

  // "tymczasowi_kur" field.
  List<DocumentReference>? _tymczasowiKur;
  List<DocumentReference> get tymczasowiKur => _tymczasowiKur ?? const [];
  bool hasTymczasowiKur() => _tymczasowiKur != null;

  // "powiadomienie" field.
  String? _powiadomienie;
  String get powiadomienie => _powiadomienie ?? '';
  bool hasPowiadomienie() => _powiadomienie != null;

  // "mojezlecenia" field.
  List<DocumentReference>? _mojezlecenia;
  List<DocumentReference> get mojezlecenia => _mojezlecenia ?? const [];
  bool hasMojezlecenia() => _mojezlecenia != null;

  // "zwolniony" field.
  bool? _zwolniony;
  bool get zwolniony => _zwolniony ?? false;
  bool hasZwolniony() => _zwolniony != null;

  // "portfel" field.
  double? _portfel;
  double get portfel => _portfel ?? 0.0;
  bool hasPortfel() => _portfel != null;

  // "pracownik" field.
  bool? _pracownik;
  bool get pracownik => _pracownik ?? false;
  bool hasPracownik() => _pracownik != null;

  // "firstvisit" field.
  bool? _firstvisit;
  bool get firstvisit => _firstvisit ?? false;
  bool hasFirstvisit() => _firstvisit != null;

  // "ograniczonyadmin" field.
  bool? _ograniczonyadmin;
  bool get ograniczonyadmin => _ograniczonyadmin ?? false;
  bool hasOgraniczonyadmin() => _ograniczonyadmin != null;

  // "ban" field.
  bool? _ban;
  bool get ban => _ban ?? false;
  bool hasBan() => _ban != null;

  // "special" field.
  bool? _special;
  bool get special => _special ?? false;
  bool hasSpecial() => _special != null;

  // "grafiki" field.
  List<DocumentReference>? _grafiki;
  List<DocumentReference> get grafiki => _grafiki ?? const [];
  bool hasGrafiki() => _grafiki != null;

  // "zbiorczerestauracja" field.
  List<DocumentReference>? _zbiorczerestauracja;
  List<DocumentReference> get zbiorczerestauracja =>
      _zbiorczerestauracja ?? const [];
  bool hasZbiorczerestauracja() => _zbiorczerestauracja != null;

  // "zbiorczywlasciciel" field.
  bool? _zbiorczywlasciciel;
  bool get zbiorczywlasciciel => _zbiorczywlasciciel ?? false;
  bool hasZbiorczywlasciciel() => _zbiorczywlasciciel != null;

  // "zbiorczenazwy" field.
  List<String>? _zbiorczenazwy;
  List<String> get zbiorczenazwy => _zbiorczenazwy ?? const [];
  bool hasZbiorczenazwy() => _zbiorczenazwy != null;

  // "konserwator" field.
  bool? _konserwator;
  bool get konserwator => _konserwator ?? false;
  bool hasKonserwator() => _konserwator != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _imie = snapshotData['Imie'] as String?;
    _nazwisko = snapshotData['Nazwisko'] as String?;
    _kurier = snapshotData['Kurier'] as bool?;
    _restuaracja = snapshotData['Restuaracja'] as bool?;
    _profilowe = snapshotData['Profilowe'] as String?;
    _wpracy = snapshotData['wpracy'] as bool?;
    _restauracja = snapshotData['Restauracja'] as DocumentReference?;
    _administrator = snapshotData['Administrator'] as bool?;
    _miasto = castToType<int>(snapshotData['Miasto']);
    _tymczasowyWybranyCzas =
        castToType<int>(snapshotData['tymczasowy_wybrany_czas']);
    _tymczasoweZdj = snapshotData['tymczasowe_zdj'] as String?;
    _tymczasowiKur = getDataList(snapshotData['tymczasowi_kur']);
    _powiadomienie = snapshotData['powiadomienie'] as String?;
    _mojezlecenia = getDataList(snapshotData['mojezlecenia']);
    _zwolniony = snapshotData['zwolniony'] as bool?;
    _portfel = castToType<double>(snapshotData['portfel']);
    _pracownik = snapshotData['pracownik'] as bool?;
    _firstvisit = snapshotData['firstvisit'] as bool?;
    _ograniczonyadmin = snapshotData['ograniczonyadmin'] as bool?;
    _ban = snapshotData['ban'] as bool?;
    _special = snapshotData['special'] as bool?;
    _grafiki = getDataList(snapshotData['grafiki']);
    _zbiorczerestauracja = getDataList(snapshotData['zbiorczerestauracja']);
    _zbiorczywlasciciel = snapshotData['zbiorczywlasciciel'] as bool?;
    _zbiorczenazwy = getDataList(snapshotData['zbiorczenazwy']);
    _konserwator = snapshotData['konserwator'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? imie,
  String? nazwisko,
  bool? kurier,
  bool? restuaracja,
  String? profilowe,
  bool? wpracy,
  DocumentReference? restauracja,
  bool? administrator,
  int? miasto,
  int? tymczasowyWybranyCzas,
  String? tymczasoweZdj,
  String? powiadomienie,
  bool? zwolniony,
  double? portfel,
  bool? pracownik,
  bool? firstvisit,
  bool? ograniczonyadmin,
  bool? ban,
  bool? special,
  bool? zbiorczywlasciciel,
  bool? konserwator,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Imie': imie,
      'Nazwisko': nazwisko,
      'Kurier': kurier,
      'Restuaracja': restuaracja,
      'Profilowe': profilowe,
      'wpracy': wpracy,
      'Restauracja': restauracja,
      'Administrator': administrator,
      'Miasto': miasto,
      'tymczasowy_wybrany_czas': tymczasowyWybranyCzas,
      'tymczasowe_zdj': tymczasoweZdj,
      'powiadomienie': powiadomienie,
      'zwolniony': zwolniony,
      'portfel': portfel,
      'pracownik': pracownik,
      'firstvisit': firstvisit,
      'ograniczonyadmin': ograniczonyadmin,
      'ban': ban,
      'special': special,
      'zbiorczywlasciciel': zbiorczywlasciciel,
      'konserwator': konserwator,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.imie == e2?.imie &&
        e1?.nazwisko == e2?.nazwisko &&
        e1?.kurier == e2?.kurier &&
        e1?.restuaracja == e2?.restuaracja &&
        e1?.profilowe == e2?.profilowe &&
        e1?.wpracy == e2?.wpracy &&
        e1?.restauracja == e2?.restauracja &&
        e1?.administrator == e2?.administrator &&
        e1?.miasto == e2?.miasto &&
        e1?.tymczasowyWybranyCzas == e2?.tymczasowyWybranyCzas &&
        e1?.tymczasoweZdj == e2?.tymczasoweZdj &&
        listEquality.equals(e1?.tymczasowiKur, e2?.tymczasowiKur) &&
        e1?.powiadomienie == e2?.powiadomienie &&
        listEquality.equals(e1?.mojezlecenia, e2?.mojezlecenia) &&
        e1?.zwolniony == e2?.zwolniony &&
        e1?.portfel == e2?.portfel &&
        e1?.pracownik == e2?.pracownik &&
        e1?.firstvisit == e2?.firstvisit &&
        e1?.ograniczonyadmin == e2?.ograniczonyadmin &&
        e1?.ban == e2?.ban &&
        e1?.special == e2?.special &&
        listEquality.equals(e1?.grafiki, e2?.grafiki) &&
        listEquality.equals(e1?.zbiorczerestauracja, e2?.zbiorczerestauracja) &&
        e1?.zbiorczywlasciciel == e2?.zbiorczywlasciciel &&
        listEquality.equals(e1?.zbiorczenazwy, e2?.zbiorczenazwy) &&
        e1?.konserwator == e2?.konserwator;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.imie,
        e?.nazwisko,
        e?.kurier,
        e?.restuaracja,
        e?.profilowe,
        e?.wpracy,
        e?.restauracja,
        e?.administrator,
        e?.miasto,
        e?.tymczasowyWybranyCzas,
        e?.tymczasoweZdj,
        e?.tymczasowiKur,
        e?.powiadomienie,
        e?.mojezlecenia,
        e?.zwolniony,
        e?.portfel,
        e?.pracownik,
        e?.firstvisit,
        e?.ograniczonyadmin,
        e?.ban,
        e?.special,
        e?.grafiki,
        e?.zbiorczerestauracja,
        e?.zbiorczywlasciciel,
        e?.zbiorczenazwy,
        e?.konserwator
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
