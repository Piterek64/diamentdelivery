import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _startDate = prefs.containsKey('ff_startDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_startDate')!)
          : _startDate;
    });
    _safeInit(() {
      _endDate = prefs.containsKey('ff_endDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_endDate')!)
          : _endDate;
    });
    _safeInit(() {
      _tymDate = prefs.containsKey('ff_tymDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_tymDate')!)
          : _tymDate;
    });
    _safeInit(() {
      _powiadom = prefs.getBool('ff_powiadom') ?? _powiadom;
    });
    _safeInit(() {
      _POWOCZ = prefs.getBool('ff_POWOCZ') ?? _POWOCZ;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _tymczasowyczas = 0;
  int get tymczasowyczas => _tymczasowyczas;
  set tymczasowyczas(int value) {
    _tymczasowyczas = value;
  }

  bool _nagodzine = false;
  bool get nagodzine => _nagodzine;
  set nagodzine(bool value) {
    _nagodzine = value;
  }

  String _godzina = '';
  String get godzina => _godzina;
  set godzina(String value) {
    _godzina = value;
  }

  String _tymczasowezdj = '';
  String get tymczasowezdj => _tymczasowezdj;
  set tymczasowezdj(String value) {
    _tymczasowezdj = value;
  }

  DocumentReference? _tymczasowezlecenie =
      FirebaseFirestore.instance.doc('/Zamowienie/1');
  DocumentReference? get tymczasowezlecenie => _tymczasowezlecenie;
  set tymczasowezlecenie(DocumentReference? value) {
    _tymczasowezlecenie = value;
  }

  List<DocumentReference> _uzytkownicydopowiadomienia = [];
  List<DocumentReference> get uzytkownicydopowiadomienia =>
      _uzytkownicydopowiadomienia;
  set uzytkownicydopowiadomienia(List<DocumentReference> value) {
    _uzytkownicydopowiadomienia = value;
  }

  void addToUzytkownicydopowiadomienia(DocumentReference value) {
    uzytkownicydopowiadomienia.add(value);
  }

  void removeFromUzytkownicydopowiadomienia(DocumentReference value) {
    uzytkownicydopowiadomienia.remove(value);
  }

  void removeAtIndexFromUzytkownicydopowiadomienia(int index) {
    uzytkownicydopowiadomienia.removeAt(index);
  }

  void updateUzytkownicydopowiadomieniaAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    uzytkownicydopowiadomienia[index] =
        updateFn(_uzytkownicydopowiadomienia[index]);
  }

  void insertAtIndexInUzytkownicydopowiadomienia(
      int index, DocumentReference value) {
    uzytkownicydopowiadomienia.insert(index, value);
  }

  bool _firstvisit = true;
  bool get firstvisit => _firstvisit;
  set firstvisit(bool value) {
    _firstvisit = value;
  }

  String _Dzwiek1 =
      'https://firebasestorage.googleapis.com/v0/b/diamentdelivery-s9l4hs.appspot.com/o/users%2FKY4jVH9UW5M2MouEj3gJwB46wHj1%2Fuploads%2F1718579736433000.mp3?alt=media&token=0b511d59-9bd8-414e-b749-d472243a0e26';
  String get Dzwiek1 => _Dzwiek1;
  set Dzwiek1(String value) {
    _Dzwiek1 = value;
  }

  String _nazwadzwieku = '';
  String get nazwadzwieku => _nazwadzwieku;
  set nazwadzwieku(String value) {
    _nazwadzwieku = value;
  }

  bool _dzisiaj = true;
  bool get dzisiaj => _dzisiaj;
  set dzisiaj(bool value) {
    _dzisiaj = value;
  }

  bool _wczoraj = false;
  bool get wczoraj => _wczoraj;
  set wczoraj(bool value) {
    _wczoraj = value;
  }

  List<DocumentReference> _tymlista = [];
  List<DocumentReference> get tymlista => _tymlista;
  set tymlista(List<DocumentReference> value) {
    _tymlista = value;
  }

  void addToTymlista(DocumentReference value) {
    tymlista.add(value);
  }

  void removeFromTymlista(DocumentReference value) {
    tymlista.remove(value);
  }

  void removeAtIndexFromTymlista(int index) {
    tymlista.removeAt(index);
  }

  void updateTymlistaAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    tymlista[index] = updateFn(_tymlista[index]);
  }

  void insertAtIndexInTymlista(int index, DocumentReference value) {
    tymlista.insert(index, value);
  }

  String _typfiltradziswczoraj = '';
  String get typfiltradziswczoraj => _typfiltradziswczoraj;
  set typfiltradziswczoraj(String value) {
    _typfiltradziswczoraj = value;
  }

  DateTime? _startDate = DateTime.fromMillisecondsSinceEpoch(1720304040000);
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
    value != null
        ? prefs.setInt('ff_startDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_startDate');
  }

  DateTime? _endDate = DateTime.fromMillisecondsSinceEpoch(1720304040000);
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
    value != null
        ? prefs.setInt('ff_endDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_endDate');
  }

  bool _ZAKRESDAT = false;
  bool get ZAKRESDAT => _ZAKRESDAT;
  set ZAKRESDAT(bool value) {
    _ZAKRESDAT = value;
  }

  bool _POJDATA = true;
  bool get POJDATA => _POJDATA;
  set POJDATA(bool value) {
    _POJDATA = value;
  }

  DateTime? _tymDate = DateTime.fromMillisecondsSinceEpoch(1720304040000);
  DateTime? get tymDate => _tymDate;
  set tymDate(DateTime? value) {
    _tymDate = value;
    value != null
        ? prefs.setInt('ff_tymDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_tymDate');
  }

  DocumentReference? _tymkurier = FirebaseFirestore.instance.doc('/User/1');
  DocumentReference? get tymkurier => _tymkurier;
  set tymkurier(DocumentReference? value) {
    _tymkurier = value;
  }

  DocumentReference? _tymrestauracja =
      FirebaseFirestore.instance.doc('/Restauracja/1');
  DocumentReference? get tymrestauracja => _tymrestauracja;
  set tymrestauracja(DocumentReference? value) {
    _tymrestauracja = value;
  }

  bool _widoczne = true;
  bool get widoczne => _widoczne;
  set widoczne(bool value) {
    _widoczne = value;
  }

  DocumentReference? _tympowiadkur =
      FirebaseFirestore.instance.doc('/powiadomieniedokuriera/1');
  DocumentReference? get tympowiadkur => _tympowiadkur;
  set tympowiadkur(DocumentReference? value) {
    _tympowiadkur = value;
  }

  DocumentReference? _tympowres =
      FirebaseFirestore.instance.doc('/powiadomienieprzyjalem/1');
  DocumentReference? get tympowres => _tympowres;
  set tympowres(DocumentReference? value) {
    _tympowres = value;
  }

  bool _wybrane = false;
  bool get wybrane => _wybrane;
  set wybrane(bool value) {
    _wybrane = value;
  }

  int _licznikpomocy = 0;
  int get licznikpomocy => _licznikpomocy;
  set licznikpomocy(int value) {
    _licznikpomocy = value;
  }

  int _pomoc2 = 0;
  int get pomoc2 => _pomoc2;
  set pomoc2(int value) {
    _pomoc2 = value;
  }

  int _licznikosos = 0;
  int get licznikosos => _licznikosos;
  set licznikosos(int value) {
    _licznikosos = value;
  }

  String _DCZKA = '';
  String get DCZKA => _DCZKA;
  set DCZKA(String value) {
    _DCZKA = value;
  }

  int _DCZKANIA = 0;
  int get DCZKANIA => _DCZKANIA;
  set DCZKANIA(int value) {
    _DCZKANIA = value;
  }

  bool _powiadom = false;
  bool get powiadom => _powiadom;
  set powiadom(bool value) {
    _powiadom = value;
    prefs.setBool('ff_powiadom', value);
  }

  DocumentReference? _doppolaczenia =
      FirebaseFirestore.instance.doc('/Zamowienie/1');
  DocumentReference? get doppolaczenia => _doppolaczenia;
  set doppolaczenia(DocumentReference? value) {
    _doppolaczenia = value;
  }

  String _tymczasowozdjecieupload = '';
  String get tymczasowozdjecieupload => _tymczasowozdjecieupload;
  set tymczasowozdjecieupload(String value) {
    _tymczasowozdjecieupload = value;
  }

  bool _odswiezaniegieldy = false;
  bool get odswiezaniegieldy => _odswiezaniegieldy;
  set odswiezaniegieldy(bool value) {
    _odswiezaniegieldy = value;
  }

  DateTime? _tymdata = DateTime.fromMillisecondsSinceEpoch(1719358140000);
  DateTime? get tymdata => _tymdata;
  set tymdata(DateTime? value) {
    _tymdata = value;
  }

  int _loop = 0;
  int get loop => _loop;
  set loop(int value) {
    _loop = value;
  }

  String _zdj = '';
  String get zdj => _zdj;
  set zdj(String value) {
    _zdj = value;
  }

  bool _POWOCZ = true;
  bool get POWOCZ => _POWOCZ;
  set POWOCZ(bool value) {
    _POWOCZ = value;
    prefs.setBool('ff_POWOCZ', value);
  }

  String _timestamp = '';
  String get timestamp => _timestamp;
  set timestamp(String value) {
    _timestamp = value;
  }

  String _type = '';
  String get type => _type;
  set type(String value) {
    _type = value;
  }

  String _number = '';
  String get number => _number;
  set number(String value) {
    _number = value;
  }

  String _duration = '';
  String get duration => _duration;
  set duration(String value) {
    _duration = value;
  }

  bool _petla = false;
  bool get petla => _petla;
  set petla(bool value) {
    _petla = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
