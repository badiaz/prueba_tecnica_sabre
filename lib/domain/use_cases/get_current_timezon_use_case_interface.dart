import 'package:time_zone_app/domain/entities/time_entity.dart';

abstract class GetCurrentTimezoneUseCaseInterface {
  Future<TimeEntity> call();
}
