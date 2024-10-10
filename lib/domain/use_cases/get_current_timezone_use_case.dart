import 'package:time_zone_app/domain/entities/time_entity.dart';
import 'package:time_zone_app/domain/use_cases/get_current_timezon_use_case_interface.dart';
import 'package:time_zone_app/infrastructure/repositories/time/timezone_respository_interface.dart';

class GetCurrentTimezoneUseCase implements GetCurrentTimezoneUseCaseInterface {
  final TimezoneRespositoryInterface timeRespository;

  GetCurrentTimezoneUseCase({required this.timeRespository});

  @override
  Future<TimeEntity> call() {
    return timeRespository.getCurrentTimeZone();
  }
}
