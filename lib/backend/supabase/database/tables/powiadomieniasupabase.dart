import '../database.dart';

class PowiadomieniasupabaseTable
    extends SupabaseTable<PowiadomieniasupabaseRow> {
  @override
  String get tableName => 'powiadomieniasupabase';

  @override
  PowiadomieniasupabaseRow createRow(Map<String, dynamic> data) =>
      PowiadomieniasupabaseRow(data);
}

class PowiadomieniasupabaseRow extends SupabaseDataRow {
  PowiadomieniasupabaseRow(super.data);

  @override
  SupabaseTable get table => PowiadomieniasupabaseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get miasto => getField<int>('miasto');
  set miasto(int? value) => setField<int>('miasto', value);
}
