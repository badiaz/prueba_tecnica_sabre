import 'package:time_zone_app/domain/use_cases/get_timezones_use_case_interface.dart';
import 'package:time_zone_app/infrastructure/repositories/time/time_respository_interface.dart';

class GetTimezonesUseCase implements GetTimezonesUseCaseInterface {
  final TimeRespositoryInterface timeRespository;

  GetTimezonesUseCase({required this.timeRespository});
  @override
  Future<List<String>> call() {
    return timeRespository.getTimeZones();
  }
}
