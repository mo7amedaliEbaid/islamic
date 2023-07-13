import 'package:floor/floor.dart';

import '../../domain/models/adhkar/custom_adhkar_model.dart';

@dao
abstract class AppDao {
  @Query("SELECT * FROM CustomAdhkarEntity")
  Future<List<CustomAdhkarEntity>> getAllCustomAdhkar();

  @Query("SELECT * FROM CustomAdhkarEntity WHERE dhikr = :dhikr")
  Future<CustomAdhkarEntity?> getDhikrByDhikrText(String dhikr);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertDhikr(CustomAdhkarEntity dhikr);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateDhikr(CustomAdhkarEntity dhikr);

  @Query("DELETE FROM CustomAdhkarEntity WHERE dhikr = :dhikr")
  Future<void> delDhikrByDhikrText(String dhikr);

  @delete
  Future<void> deleteAllCustomAdhkar(List<CustomAdhkarEntity> list);
}
