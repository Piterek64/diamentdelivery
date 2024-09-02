import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListenMiastaRecord extends FirestoreRecord {
  ListenMiastaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "miasto" field.
  int? _miasto;
  int get miasto => _miasto ?? 0;
  bool hasMiasto() => _miasto != null;

  // "powiadomienie" field.
  int? _powiadomienie;
  int get powiadomienie => _powiadomienie ?? 0;
  bool hasPowiadomienie() => _powiadomienie != null;

  void _initializeFields() {
    _miasto = castToType<int>(snapshotData['miasto']);
    _powiadomienie = castToType<int>(snapshotData['powiadomienie']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ListenMiasta');

  static Stream<ListenMiastaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListenMiastaRecord.fromSnapshot(s));

  static Future<ListenMiastaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListenMiastaRecord.fromSnapshot(s));

  static ListenMiastaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListenMiastaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListenMiastaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListenMiastaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListenMiastaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListenMiastaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListenMiastaRecordData({
  int? miasto,
  int? powiadomienie,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'miasto': miasto,
      'powiadomienie': powiadomienie,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListenMiastaRecordDocumentEquality
    implements Equality<ListenMiastaRecord> {
  const ListenMiastaRecordDocumentEquality();

  @override
  bool equals(ListenMiastaRecord? e1, ListenMiastaRecord? e2) {
    return e1?.miasto == e2?.miasto && e1?.powiadomienie == e2?.powiadomienie;
  }

  @override
  int hash(ListenMiastaRecord? e) =>
      const ListEquality().hash([e?.miasto, e?.powiadomienie]);

  @override
  bool isValidKey(Object? o) => o is ListenMiastaRecord;
}
