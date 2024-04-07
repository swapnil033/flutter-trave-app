// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorTravelDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TravelDatabaseBuilder databaseBuilder(String name) =>
      _$TravelDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TravelDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$TravelDatabaseBuilder(null);
}

class _$TravelDatabaseBuilder {
  _$TravelDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$TravelDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TravelDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TravelDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TravelDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TravelDatabase extends TravelDatabase {
  _$TravelDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TravelDao? _travelDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `travel_table` (`id` INTEGER NOT NULL, `placeName` TEXT NOT NULL, `date` TEXT NOT NULL, `review` TEXT NOT NULL, `rating` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TravelDao get travelDao {
    return _travelDaoInstance ??= _$TravelDao(database, changeListener);
  }
}

class _$TravelDao extends TravelDao {
  _$TravelDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _travelModelInsertionAdapter = InsertionAdapter(
            database,
            'travel_table',
            (TravelModel item) => <String, Object?>{
                  'id': item.id,
                  'placeName': item.placeName,
                  'date': item.date,
                  'review': item.review,
                  'rating': item.rating
                }),
        _travelModelDeletionAdapter = DeletionAdapter(
            database,
            'travel_table',
            ['id'],
            (TravelModel item) => <String, Object?>{
                  'id': item.id,
                  'placeName': item.placeName,
                  'date': item.date,
                  'review': item.review,
                  'rating': item.rating
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TravelModel> _travelModelInsertionAdapter;

  final DeletionAdapter<TravelModel> _travelModelDeletionAdapter;

  @override
  Future<List<TravelModel>> getTravelList() async {
    return _queryAdapter.queryList('SELECT * FROM travel_table',
        mapper: (Map<String, Object?> row) => TravelModel(
            id: row['id'] as int,
            placeName: row['placeName'] as String,
            date: row['date'] as String,
            review: row['review'] as String,
            rating: row['rating'] as int));
  }

  @override
  Future<void> addTravel(TravelModel travelModel) async {
    await _travelModelInsertionAdapter.insert(
        travelModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteTravel(TravelModel travelModel) async {
    await _travelModelDeletionAdapter.delete(travelModel);
  }
}
