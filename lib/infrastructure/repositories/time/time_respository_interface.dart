import 'package:time_zone_app/domain/entities/time_entity.dart';

abstract class TimeRespositoryInterface {
  Future<TimeEntity> getTimeForTimeZone({required String timeZone});
  Future<List<String>> getTimeZones();
}
