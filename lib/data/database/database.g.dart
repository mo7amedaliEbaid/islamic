// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AppDao? _appDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CustomAdhkarEntity` (`dhikr` TEXT NOT NULL, `count` INTEGER NOT NULL, PRIMARY KEY (`dhikr`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AppDao get appDao {
    return _appDaoInstance ??= _$AppDao(database, changeListener);
  }
}

class _$AppDao extends AppDao {
  _$AppDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _customAdhkarEntityInsertionAdapter = InsertionAdapter(
            database,
            'CustomAdhkarEntity',
            (CustomAdhkarEntity item) =>
                <String, Object?>{'dhikr': item.dhikr, 'count': item.count}),
        _customAdhkarEntityUpdateAdapter = UpdateAdapter(
            database,
            'CustomAdhkarEntity',
            ['dhikr'],
            (CustomAdhkarEntity item) =>
                <String, Object?>{'dhikr': item.dhikr, 'count': item.count}),
        _customAdhkarEntityDeletionAdapter = DeletionAdapter(
            database,
            'CustomAdhkarEntity',
            ['dhikr'],
            (CustomAdhkarEntity item) =>
                <String, Object?>{'dhikr': item.dhikr, 'count': item.count});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CustomAdhkarEntity>
      _customAdhkarEntityInsertionAdapter;

  final UpdateAdapter<CustomAdhkarEntity> _customAdhkarEntityUpdateAdapter;

  final DeletionAdapter<CustomAdhkarEntity> _customAdhkarEntityDeletionAdapter;

  @override
  Future<List<CustomAdhkarEntity>> getAllCustomAdhkar() async {
    return _queryAdapter.queryList('SELECT * FROM CustomAdhkarEntity',
        mapper: (Map<String, Object?> row) => CustomAdhkarEntity(
            dhikr: row['dhikr'] as String, count: row['count'] as int));
  }

  @override
  Future<CustomAdhkarEntity?> getDhikrByDhikrText(String dhikr) async {
    return _queryAdapter.query(
        'SELECT * FROM CustomAdhkarEntity WHERE dhikr = ?1',
        mapper: (Map<String, Object?> row) => CustomAdhkarEntity(
            dhikr: row['dhikr'] as String, count: row['count'] as int),
        arguments: [dhikr]);
  }

  @override
  Future<void> delDhikrByDhikrText(String dhikr) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM CustomAdhkarEntity WHERE dhikr = ?1',
        arguments: [dhikr]);
  }

  @override
  Future<void> insertDhikr(CustomAdhkarEntity dhikr) async {
    await _customAdhkarEntityInsertionAdapter.insert(
        dhikr, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateDhikr(CustomAdhkarEntity dhikr) async {
    await _customAdhkarEntityUpdateAdapter.update(
        dhikr, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteAllCustomAdhkar(List<CustomAdhkarEntity> list) async {
    await _customAdhkarEntityDeletionAdapter.deleteList(list);
  }
}
