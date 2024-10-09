import 'package:time_zone_app/domain/entities/time_entity.dart';
import 'package:time_zone_app/domain/use_cases/get_time_for_timezone_use_case_interface.dart';
import 'package:time_zone_app/infrastructure/repositories/time/time_respository_interface.dart';

class GetTimeForTimezoneUseCase implements GetTimeForTimezoneUseCaseInterface {
  final TimeRespositoryInterface timeRespository;

  GetTimeForTimezoneUseCase({required this.timeRespository});

  @override
  Future<TimeEntity> call({required String timeZone}) {
    return timeRespository.getTimeForTimeZone(timeZone: timeZone);
  }
}
