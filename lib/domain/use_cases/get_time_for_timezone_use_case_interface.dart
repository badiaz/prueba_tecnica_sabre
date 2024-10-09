import 'package:time_zone_app/domain/entities/time_entity.dart';

abstract class GetTimeForTimezoneUseCaseInterface {
  Future<TimeEntity> call({required String timeZone});
}
