import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../domain/models/adhkar/custom_adhkar_model.dart';
import 'dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [CustomAdhkarEntity])
abstract class AppDatabase extends FloorDatabase {
  AppDao get appDao;
}
